defmodule QuantifiedSelfPhoenix.MealFoods.MealFood do
  use Ecto.Schema
  import Ecto.Changeset


  schema "mealfoods" do
    belongs_to :food, QuantifiedSelfPhoenix.Foods.Food
    belongs_to :meal, QuantifiedSelfPhoenix.Meals.Meal

    timestamps()
  end

  @doc false
  def changeset(meal_food, attrs) do
    meal_food
    |> cast(attrs, [:meal_id, :food_id])
    |> validate_required([:meal_id, :food_id])
    |> foreign_key_constraint(:meal_id, meal_id: :mealfoods_meal_id_fkey)
    |> foreign_key_constraint(:food_id, food_id: :mealfoods_food_id_fkey)
  end
end
