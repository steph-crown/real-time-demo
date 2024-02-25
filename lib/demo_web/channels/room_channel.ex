defmodule DemoWeb.RoomChannel do
  use DemoWeb, :channel

  # intercept ["shout"]

  @impl true
  def join("room:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("ping:shutdown", _payload, socket) do
    {:stop, :shutdown, {:msg, "Shut down"}, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  # Handle messages with payload pattern {"type": "basic"}
  def handle_in("ping", %{"type" => "basic"} = payload, socket) do
    {:reply,
     {:ok,
      %{
        text: "Handling basic ping",
        payload: payload
      }}, socket}
  end

  def handle_in("ping", %{"msg" => msg}, socket) do
    push(socket, "new_message", %{msg: msg})

    {:reply, {:ok, :success}, socket}
  end

  def handle_in("ping:" <> group, payload, socket) do
    {:reply, {:ok, %{group: group, payload: payload}}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end

  @impl true
  def handle_out("shout", payload, socket) do
    # Preprocess the outgoing message payload here
    processed_payload = Map.put_new(payload, "content", "Modified payload")

    # push the modified payload
    push(socket, "shout", processed_payload)

    {:noreply, socket}
  end
end
