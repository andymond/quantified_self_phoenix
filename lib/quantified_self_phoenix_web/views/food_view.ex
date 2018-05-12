defmodule QuantifiedSelfPhoenixWeb.FoodView do
  use QuantifiedSelfPhoenixWeb, :view
  alias QuantifiedSelfPhoenixWeb.FoodView

  def render("index.json", %{foods: foods}) do
    render_many(foods, FoodView, "food.json")
  end

  def render("show.json", %{food: food}) do
    render_one(food, FoodView, "food.json")
  end

  def render("food.json", %{food: food}) do
    %{id: food.id,
      name: food.name,
      calories: food.calories}
  end
end
