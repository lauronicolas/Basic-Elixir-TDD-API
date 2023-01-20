defmodule Backend.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @field ~w/name description/a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "categories" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  def changeset(attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(module, attrs) do
    module
    |> cast(attrs, @field)
    |> update_change(:name, &String.upcase/1)
    |> validate_required(@field)
    |> unique_constraint(:name)
  end


end
