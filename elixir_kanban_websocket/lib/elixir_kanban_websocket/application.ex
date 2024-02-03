defmodule ElixirKanbanWebsocket.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirKanbanWebsocketWeb.Telemetry,
      # Start the Ecto repository
      ElixirKanbanWebsocket.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirKanbanWebsocket.PubSub},
      # Start Finch
      {Finch, name: ElixirKanbanWebsocket.Finch},
      # Start the Endpoint (http/https)
      ElixirKanbanWebsocketWeb.Endpoint
      # Start a worker by calling: ElixirKanbanWebsocket.Worker.start_link(arg)
      # {ElixirKanbanWebsocket.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirKanbanWebsocket.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirKanbanWebsocketWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
