defmodule QuantifiedSelfPhoenixWeb.MealFoodControllerTest do
  use QuantifiedSelfPhoenixWeb.ConnCase

  alias QuantifiedSelfPhoenix.MealFoods
  alias QuantifiedSelfPhoenix.MealFoods.MealFood

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:meal_food) do
    {:ok, meal_food} = MealFoods.create_meal_food(@create_attrs)
    meal_food
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # describe "create meal_food" do
  #   test "renders meal_food when data is valid", %{conn: conn} do
  #     conn = post conn, "/meals/1/foods/1"
  #     assert %{"id" => id} = json_response(conn, 201)["data"]
  #
  #     conn = get conn, meal_food_path(conn, :show, id)
  #     assert json_response(conn, 200)["data"] == %{
  #       "id" => id}
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post conn, "/meals/:meal_id/foods/:id"
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end
  #
  # describe "delete meal_food" do
  #   setup [:create_meal_food]
  #
  #   test "deletes chosen meal_food", %{conn: conn, meal_food: meal_food} do
  #     conn = delete conn, "/meals/:meal_id/foods/:id"
  #     assert response(conn, 204)
  #     assert_error_sent 404, fn ->
  #       get conn, meal_food_path(conn, :show, meal_food)
  #     end
  #   end
  # end

  defp create_meal_food(_) do
    meal_food = fixture(:meal_food)
    {:ok, meal_food: meal_food}
  end
end
