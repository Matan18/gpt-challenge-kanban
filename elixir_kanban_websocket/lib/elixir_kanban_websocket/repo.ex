defmodule ElixirKanbanWebsocket.Repo do
  use Ecto.Repo,
    otp_app: :elixir_kanban_websocket,
    adapter: Ecto.Adapters.Postgres
end
