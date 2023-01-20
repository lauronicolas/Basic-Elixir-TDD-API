defmodule Backend.Categories do

  alias Backend.Categories.Category
  alias Backend.Repo

  def all do
    Repo.all(Category)
  end

  def create(payload) do
    payload
    |> Category.changeset()
    |> Repo.insert()
  end

end
