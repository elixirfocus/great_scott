defmodule GreatScottWeb.PageController do
  use GreatScottWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
