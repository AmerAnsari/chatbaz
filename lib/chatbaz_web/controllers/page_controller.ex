defmodule ChatbazWeb.PageController do
  use ChatbazWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
