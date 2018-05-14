defmodule QuantifiedSelfPhoenixWeb.MealFoodController do
  use QuantifiedSelfPhoenixWeb, :controller

  alias QuantifiedSelfPhoenix.MealFoods
  alias QuantifiedSelfPhoenix.MealFoods.MealFood

  action_fallback QuantifiedSelfPhoenixWeb.FallbackController
  #
  # def create(conn, %{"meal_food" => meal_food_params}) do
  #   with {:ok, %MealFood{} = meal_food} <- MealFoods.create_meal_food(meal_food_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", meal_food_path(conn, :show, meal_food))
  #     |> render("show.json", meal_food: meal_food)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   meal_food = MealFoods.get_meal_food!(id)
  #   with {:ok, %MealFood{}} <- MealFoods.delete_meal_food(meal_food) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
