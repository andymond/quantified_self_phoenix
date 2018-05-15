defmodule QuantifiedSelfPhoenixWeb.MealFoodController do
  use QuantifiedSelfPhoenixWeb, :controller

  alias QuantifiedSelfPhoenix.MealFoods
  alias QuantifiedSelfPhoenix.MealFoods.MealFood
  alias QuantifiedSelfPhoenix.Meals
  alias QuantifiedSelfPhoenix.Foods

  action_fallback QuantifiedSelfPhoenixWeb.FallbackController

  def create(conn, %{"food_id" => food_id, "meal_id" => meal_id} = meal_food_params) do
    meal = Meals.get_meal!(meal_id)
    food = Foods.get_food!(food_id)
    with {:ok, %MealFood{}} <- MealFoods.create_meal_food(meal_food_params) do
      conn
      |> put_status(:created)
      |> render("success.json", names: %{meal: meal.name, food: food.name})
    end
  end
  #
  # def delete(conn, %{"id" => id}) do
  #   meal_food = MealFoods.get_meal_food!(id)
  #   with {:ok, %MealFood{}} <- MealFoods.delete_meal_food(meal_food) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
