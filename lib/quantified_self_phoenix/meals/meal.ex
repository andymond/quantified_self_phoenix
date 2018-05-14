defmodule QuantifiedSelfPhoenix.Meals.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "meals" do
    field :name, :string

    timestamps()

    many_to_many :foods, QuantifiedSelfPhoenix.Foods.Food, join_through: "mealfoods"
  end

  @doc false
  def changeset(meal, attrs) do
    meal
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
