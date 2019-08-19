defmodule PhxappWeb.PageController do
  use PhxappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
