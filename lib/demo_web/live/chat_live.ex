defmodule DemoWeb.ChatLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, messages: [])}
  end

  def handle_event("add-message", %{"message" => message}, socket) do
    IO.inspect(message)
    {:noreply, assign(socket, messages: [message | socket.assigns.messages])}
  end
end
