defmodule QuantifiedSelfPhoenixWeb.MealFoodView do
  use QuantifiedSelfPhoenixWeb, :view
  alias QuantifiedSelfPhoenixWeb.MealFoodView

  def render("index.json", %{mealfoods: mealfoods}) do
    %{data: render_many(mealfoods, MealFoodView, "meal_food.json")}
  end

  def render("created.json", %{names: names}) do
    %{message: "Successfully added #{names.food} to #{names.meal}"}
  end

  def render("deleted.json", %{names: names}) do
    %{message: "Successfully removed #{names.food} from #{names.meal}"}
  end

  def render("meal_food.json", %{meal_food: meal_food}) do
    %{id: meal_food.id}
  end
end
