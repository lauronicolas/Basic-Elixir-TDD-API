defmodule BackendWeb.CategoryControllerTest do
  use BackendWeb.ConnCase
  alias Backend.Categories

  describe "categories" do
    test "list all categories", %{conn: conn} do
      conn = get(conn, Routes.category_path(conn, :index))
      assert json_response(conn, 200) == []
    end

    test "Deve criar uma categoria", %{conn: conn} do
      payload = %{name: "Sport", description: "Catatau"}
      conn = post(conn, Routes.category_path(conn, :create, category: payload))
      assert %{ "id" => id} = json_response(conn, 201)

      conn = get(conn, Routes.category_path(conn, :show, id))
      assert %{"id" => id, "description" => "Catatau", "name" => "SPORT"} = json_response(conn, 200)
    end

    test "Deve lançar um erro quando criar uma categoria ja existente", %{conn: conn} do
      payload = %{name: "Sport", description: "Catatau"}
      Categories.create(payload)
      conn = post(conn, Routes.category_path(conn, :create, category: payload))
      assert "has already been taken" in json_response(conn, 422)["errors"]["name"]
    end

  end
end
