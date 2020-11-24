defmodule HanhchinhvnApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HanhchinhvnApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HanhchinhvnApi.PubSub},
      # Start the Endpoint (http/https)
      HanhchinhvnApiWeb.Endpoint,
      # Start a worker by calling: HanhchinhvnApi.Worker.start_link(arg)
      # {HanhchinhvnApi.Worker, arg}
      HanhchinhvnApi.Storage,
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HanhchinhvnApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HanhchinhvnApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
