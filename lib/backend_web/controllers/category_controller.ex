defmodule BackendWeb.CategoryController do
  use BackendWeb, :controller
  alias Backend.Categories
  alias Backend.Categories.Category

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", categories: Categories.all())
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", category: Categories.show(id))
  end

  def create(conn, %{"category" => category}) do
    with {:ok, %Category{} = category} <- Categories.create(category) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.category_path(conn, :show, category))
      |> render("show.json", category: category)
    end
  end
end
