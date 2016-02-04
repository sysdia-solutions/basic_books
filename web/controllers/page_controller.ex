defmodule BasicBooks.PageController do
  use BasicBooks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
