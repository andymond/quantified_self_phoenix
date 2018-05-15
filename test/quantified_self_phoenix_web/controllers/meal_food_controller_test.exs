defmodule QuantifiedSelfPhoenixWeb.MealFoodControllerTest do
  use QuantifiedSelfPhoenixWeb.ConnCase

  alias QuantifiedSelfPhoenix.MealFoods
  alias QuantifiedSelfPhoenix.Meals
  alias QuantifiedSelfPhoenix.Foods

  def fixture(:meal_food) do
    meal = Meals.create_meal(%{name: "some meal"})
    food = Foods.create_food(%{name: "some food"})
    {:ok, meal_food} = MealFoods.create_meal_food(%{meal_id: meal.id, food_id: food.id})
    meal_food
  end

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

    # test "renders errors when data is invalid", %{conn: conn} do
    #   conn = post conn, "/api/v1/meals/1/foods/1"
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  # describe "delete meal_food" do
  #   setup [:create_meal_food]
  #
  #   test "deletes chosen meal_food", %{conn: conn, meal_food: meal_food} do
  #     conn = delete conn, "/meals/:meal_id/foods/:id"
  #     assert response(conn, 204)
  #     assert_error_sent 404, fn ->
        # get conn, "/meals/1/foods/1"
  #     end
  #   end
  # end

  defp create_meal_food(_) do
    meal_food = fixture(:meal_food)
    {:ok, meal_food: meal_food}
  end
end
