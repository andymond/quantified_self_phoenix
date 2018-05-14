defmodule QuantifiedSelfPhoenix.FoodFactory do
  use ExMachina.Ecto, repo: QuantifiedSelfPhoenix.Repo

  def food_factory do
    %QuantifiedSelfPhoenix.Foods.Food{
      name: sequence(:name, &"food#{&1}"),
      calories: sequence(:calories, &"#{&1 * 100}")
    }
  end

  def meal_factory do
    %QuantifiedSelfPhoenix.Meals.Meal{
      name: sequence(:name, &"food#{&1}"),
    }
  end
end
