defmodule QuantifiedSelfPhoenixWeb.MealController do
  use QuantifiedSelfPhoenixWeb, :controller

  alias QuantifiedSelfPhoenix.Meals
  alias QuantifiedSelfPhoenix.Meals.Meal
  alias QuantifiedSelfPhoenix.Repo

  action_fallback QuantifiedSelfPhoenixWeb.FallbackController

  def index(conn, _params) do
    meals = Meals.list_meals()

    render(conn, "index.json", meals: meals)
  end

  def create(conn, %{"meal" => meal_params}) do
    with {:ok, %Meal{} = meal} <- Meals.create_meal(meal_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", meal_path(conn, :show, meal))
      |> render("show.json", meal: meal |> Repo.preload(:foods))
    end
  end

  def show(conn, %{"id" => id}) do
    meal = Meals.get_meal!(id)
    render(conn, "show.json", meal: meal)
  end

  def update(conn, %{"id" => id, "meal" => meal_params}) do
    meal = Meals.get_meal!(id)

    with {:ok, %Meal{} = meal} <- Meals.update_meal(meal, meal_params) do
      render(conn, "show.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    meal = Meals.get_meal!(id)
    with {:ok, %Meal{}} <- Meals.delete_meal(meal) do
      send_resp(conn, :no_content, "")
    end
  end
end
