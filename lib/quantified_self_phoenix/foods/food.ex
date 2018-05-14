defmodule QuantifiedSelfPhoenix.Foods.Food do
  use Ecto.Schema
  import Ecto.Changeset


  schema "foods" do
    field :calories, :integer
    field :name, :string

    timestamps()

    many_to_many :meals, QuantifiedSelfPhoenix.Meals.Meal, join_through: "mealfoods"
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :calories])
    |> validate_required([:name, :calories])
  end
end
