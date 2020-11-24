defmodule HanhchinhvnApiWeb.Router do
  use HanhchinhvnApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HanhchinhvnApiWeb do
    pipe_through :api

    get "/tinh_tp", Controller, :tinh_tp
    get "/quan_huyen/:id", Controller, :quan_huyen
    get "/xa_phuong/:id", Controller, :xa_phuong
  end
end
