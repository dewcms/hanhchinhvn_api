defmodule HanhchinhvnApiWeb.Controller do
  use HanhchinhvnApiWeb, :controller
  import Phoenix.Controller

  alias HanhchinhvnApi.Storage

  def tinh_tp(conn, _params) do
    data = Storage.tinh_tp()
    conn |> put_resp_content_type("application/json") |> send_resp(200, data)
  end

  def quan_huyen(conn, %{"id" => id}) do
    data = Storage.quan_huyen(id)
    conn |> put_resp_content_type("application/json") |> send_resp(200, data)
  end

  def xa_phuong(conn, %{"id" => id}) do
    data = Storage.xa_phuong(id)
    conn |> put_resp_content_type("application/json") |> send_resp(200, data)
  end
end
