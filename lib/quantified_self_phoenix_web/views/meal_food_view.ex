defmodule QuantifiedSelfPhoenixWeb.MealFoodView do
  use QuantifiedSelfPhoenixWeb, :view
  alias QuantifiedSelfPhoenixWeb.MealFoodView

  def render("index.json", %{mealfoods: mealfoods}) do
    %{data: render_many(mealfoods, MealFoodView, "meal_food.json")}
  end

  def render("show.json", %{meal_food: meal_food}) do
    %{data: render_one(meal_food, MealFoodView, "meal_food.json")}
  end

  def render("meal_food.json", %{meal_food: meal_food}) do
    %{id: meal_food.id}
  end
end
