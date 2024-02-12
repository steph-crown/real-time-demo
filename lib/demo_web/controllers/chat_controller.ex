defmodule DemoWeb.ChatController do
  use DemoWeb, :controller

  def index(conn, _params) do
    # renders the index chat page.
    render(conn, :index, layout: false)
  end
end
