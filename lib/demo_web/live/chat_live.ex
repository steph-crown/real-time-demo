defmodule DemoWeb.ChatLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    messages = ["Initial Message", "Message before initial"]
    socket = assign(socket, messages: messages)

    {:ok, push_event(socket, "client.add-message", %{messages: messages})}
  end

  def handle_event("add-message", %{"message" => message}, socket) do
    socket = assign(socket, messages: [message | socket.assigns.messages])

    {:noreply, push_event(socket, "client.add-message", %{messages: socket.assigns.messages})}
  end
end
