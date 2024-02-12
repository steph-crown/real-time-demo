defmodule DemoWeb.ChatLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div>
      <h1>Chat Messages</h1>
      <ul>
        <%= for message <- @messages do %>
          <li><%= message %></li>
        <% end %>
      </ul>
      <form phx-submit="add-message">
        <input type="text" name="message" placeholder="Type a message..." />
        <button type="submit">Add</button>
      </form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, messages: [])}
  end

  def handle_event("add-message", %{"message" => message}, socket) do
    IO.inspect(message)
    {:noreply, assign(socket, messages: [message | socket.assigns.messages])}
  end
end
