defmodule Backend.CategoriesTest do

  use Backend.DataCase
  alias Backend.Categories
  alias Backend.Categories.Category

  test "Dado uma chamada de list deve retornar todas as categorias" do
    assert Categories.all() == []
  end

  test "Dado um nome de categoria que ja existe, deve gerar um erro" do
    payload = %{
      name: "Sport",
      description: "
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis est eu risus suscipit scelerisque. Proin vehicula, velit at cursus."
    }

    assert {:ok, %Category{} = category} = Categories.create(payload)
    assert {:error, changeset} = Categories.create(payload)
    assert "has already been taken" in errors_on(changeset).name
    assert %{name: ["has already been taken"]} = errors_on(changeset)

  end

  test "Dado informações sobre category, deve criar uma categoria" do
    payload = %{
      name: "Sport",
      description: "
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis est eu risus suscipit scelerisque. Proin vehicula, velit at cursus."
    }

    assert {:ok, %Category{} = category} = Categories.create(payload)
    assert category.name == String.upcase(payload.name)
    assert category.description == payload.description
  end

end
