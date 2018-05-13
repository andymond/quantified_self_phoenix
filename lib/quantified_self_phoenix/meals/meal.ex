defmodule QuantifiedSelfPhoenix.Meals.Meal do
  use Ecto.Schema
  import Ecto.Changeset


  schema "meals" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(meal, attrs) do
    meal
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
