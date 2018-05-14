defmodule QuantifiedSelfPhoenix.MealFoods.MealFood do
  use Ecto.Schema
  import Ecto.Changeset


  schema "mealfoods" do
    # field :meal_id, :id
    # field :food_id, :id

    timestamps()

    belongs_to :food, QuantifiedSelfPhoenix.Foods.Food
    belongs_to :meal, QuantifiedSelfPhoenix.Meals.Meal
  end

  @doc false
  def changeset(meal_food, attrs) do
    meal_food
    |> cast(attrs, [:meal_id, :food_id])
    |> validate_required([:meal_id, :food_id])
  end
end
