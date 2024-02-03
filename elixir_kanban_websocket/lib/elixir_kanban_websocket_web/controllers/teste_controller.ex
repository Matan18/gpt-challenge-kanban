defmodule ElixirKanbanWebsocketWeb.TesteController do
  use ElixirKanbanWebsocketWeb, :controller

  def show(conn, _params) do
    render(conn, :index, %{})
  end
end
