defmodule QuantifiedSelfPhoenixWeb.PageController do
  use QuantifiedSelfPhoenixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
