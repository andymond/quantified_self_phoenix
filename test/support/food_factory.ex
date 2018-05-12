defmodule QuantifiedSelfPhoenix.FoodFactory do
  use ExMachina.Ecto, repo: QuantifiedSelfPhoenix.Repo

  def food_factory do
    %QuantifiedSelfPhoenix.Foods.Food{
      name: sequence(:name, &"food#{&1}"),
      calories: sequence(:calories, &"food#{&1}")
    }
  end
end
