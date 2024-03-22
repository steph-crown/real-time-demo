defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  @user_id 1

  def home(conn, _params) do
    user_token = generate_token(conn, @user_id)

    conn
    |> assign(:user_token, user_token)
    |> assign(:user_id, @user_id)
    |> render(:home, layout: false)
  end

  defp generate_token(conn, user_id) do
    Phoenix.Token.sign(conn, "demo salt", user_id)
  end
end
