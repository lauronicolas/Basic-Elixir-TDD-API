defmodule Backend.Categories do

  alias Backend.Categories.Category
  alias Backend.Repo

  def all do
    Repo.all(Category)
  end

  def show(id), do: Repo.get(Category, id)

  def create(payload) do
    payload
    |> Category.changeset()
    |> Repo.insert()
  end

end
