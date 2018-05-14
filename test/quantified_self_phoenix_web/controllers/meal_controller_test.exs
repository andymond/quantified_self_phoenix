defmodule QuantifiedSelfPhoenixWeb.MealControllerTest do
  use QuantifiedSelfPhoenixWeb.ConnCase

  alias QuantifiedSelfPhoenix.Meals
  alias QuantifiedSelfPhoenix.Meals.Meal

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:meal) do
    {:ok, meal} = Meals.create_meal(@create_attrs)
    meal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all meals", %{conn: conn} do
      conn = get conn, meal_path(conn, :index)
      assert json_response(conn, 200) == []
    end
  end

  describe "create meal" do
    test "renders meal when data is valid", %{conn: conn} do
      conn = post conn, meal_path(conn, :create), meal: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)

      conn = get conn, meal_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, meal_path(conn, :create), meal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update meal" do
    setup [:create_meal]

    test "renders meal when data is valid", %{conn: conn, meal: %Meal{id: id} = meal} do
      conn = put conn, meal_path(conn, :update, meal), meal: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)

      conn = get conn, meal_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, meal: meal} do
      conn = put conn, meal_path(conn, :update, meal), meal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_meal(_) do
    meal = fixture(:meal)
    {:ok, meal: meal}
  end
end
