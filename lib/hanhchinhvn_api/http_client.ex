defmodule HanhchinhvnApi.HttpClient do
  use Tesla
  adapter(Tesla.Adapter.Hackney)
end
