defmodule QuantifiedSelfPhoenixWeb.MealFoodControllerTest do
  use QuantifiedSelfPhoenixWeb.ConnCase

  alias QuantifiedSelfPhoenix.MealFoods
  alias QuantifiedSelfPhoenix.Meals
  alias QuantifiedSelfPhoenix.Foods

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create meal_food" do
    test "renders meal_food when data is valid", %{conn: conn} do
      {:ok, meal} = Meals.create_meal(%{name: "some meal"})
      {:ok, food} = Foods.create_food(%{name: "some food", calories: 40})
      conn = post conn, "/api/v1/meals/#{meal.id}/foods/#{food.id}"
      assert %{"message" =>  "Successfully added some food to some meal"} = json_response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      assert_error_sent 404, fn ->
        post conn, "/meals/1/foods/1"
      end
    end
  end

  describe "delete meal_food" do
    test "deletes chosen meal_food", %{conn: conn} do
      {:ok, meal} = Meals.create_meal(%{name: "some meal"})
      {:ok, food} = Foods.create_food(%{name: "some food", calories: 40})
      MealFoods.create_meal_food(%{meal_id: meal.id, food_id: food.id})
      conn = delete conn, "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      assert %{"message" =>  "Successfully removed some food from some meal"} = json_response(conn, 200)
      assert_error_sent 404, fn ->
        get conn, "/meals/1/foods/1"
      end
    end
  end
end
