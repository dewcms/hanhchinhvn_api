defmodule HanhchinhvnApi.Storage do
  use GenServer
  alias HanhchinhvnApi.HttpClient

  @impl true
  def init(_opts) do
    tinh_tp =
      get!("https://raw.githubusercontent.com/joehua87/hanhchinhvn/master/dist/tinh_tp.json")
      |> Jason.decode!()
      |> Map.values()
      |> Jason.encode!()

    quan_huyen =
      get!("https://raw.githubusercontent.com/joehua87/hanhchinhvn/master/dist/quan_huyen.json")
      |> Jason.decode!()
      |> Map.values()
      |> Enum.group_by(& &1["parent_code"], &Jason.encode!/1)

    xa_phuong =
      get!("https://raw.githubusercontent.com/joehua87/hanhchinhvn/master/dist/xa_phuong.json")
      |> Jason.decode!()
      |> Map.values()
      |> Enum.group_by(& &1["parent_code"], &Jason.encode!/1)

    {:ok,
     [
       tinh_tp: tinh_tp,
       quan_huyen: quan_huyen,
       xa_phuong: xa_phuong
     ]}
  end

  @impl true
  def handle_call(:tinh_tp, _from, state) do
    data = state |> Keyword.get(:tinh_tp, %{})
    {:reply, data, state}
  end

  @impl true
  def handle_call({:quan_huyen, id}, _from, state) when is_bitstring(id) do
    data = state |> get_in([:quan_huyen, id])
    {:reply, data, state}
  end

  @impl true
  def handle_call({:xa_phuong, id}, _from, state) when is_bitstring(id) do
    data = state |> get_in([:xa_phuong, id])
    {:reply, data, state}
  end

  def start_link(opts) when is_list(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def tinh_tp() do
    GenServer.call(__MODULE__, :tinh_tp)
  end

  def quan_huyen(id) when is_bitstring(id) do
    GenServer.call(__MODULE__, {:quan_huyen, id})
  end

  def xa_phuong(id) when is_bitstring(id) do
    GenServer.call(__MODULE__, {:xa_phuong, id})
  end

  defp get!(url) when is_bitstring(url) do
    HttpClient.get!(url).body
  end
end
