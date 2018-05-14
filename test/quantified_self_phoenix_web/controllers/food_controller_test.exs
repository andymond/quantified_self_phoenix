defmodule QuantifiedSelfPhoenixWeb.FoodControllerTest do
  use QuantifiedSelfPhoenixWeb.ConnCase

  alias QuantifiedSelfPhoenix.Foods
  alias QuantifiedSelfPhoenix.Foods.Food

  @create_attrs %{calories: 42, name: "some name"}
  @update_attrs %{calories: 43, name: "some updated name"}
  @invalid_attrs %{calories: nil, name: nil}

  def fixture(:food) do
    {:ok, food} = Foods.create_food(@create_attrs)
    food
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foods", %{conn: conn} do
      food1 = insert(:food)
      food2 = insert(:food)

      conn = get conn, food_path(conn, :index)

      response = json_response(conn, 200)

      assert length(response) == 2
      assert Enum.at(response, 0)["id"] == food1.id
      assert Enum.at(response, 0)["calories"] == food1.calories
      assert Enum.at(response, 0)["name"] == food1.name
      assert Enum.at(response, 1)["id"] == food2.id
      assert Enum.at(response, 1)["calories"] == food2.calories
      assert Enum.at(response, 1)["name"] == food2.name
    end
  end

  describe "create food" do
    test "renders food when data is valid", %{conn: conn} do
      conn = post conn, food_path(conn, :create), food: @create_attrs
      assert %{"id" => id, "calories" => 42, "name" => "some name"} = json_response(conn, 201)

      conn = get conn, food_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "calories" => 42,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, food_path(conn, :create), food: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food" do
    setup [:create_food]

    test "renders food when data is valid", %{conn: conn, food: %Food{id: id} = food} do
      conn = put conn, food_path(conn, :update, food), food: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)

      conn = get conn, food_path(conn, :show, id)
      assert json_response(conn, 200) == %{
        "id" => id,
        "calories" => 43,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, food: food} do
      conn = put conn, food_path(conn, :update, food), food: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food" do
    setup [:create_food]

    test "renders food when data is valid", %{conn: conn, food: %Food{} = food} do
      conn = delete conn, food_path(conn, :delete, food)
      assert response(conn, 204)
    end

    test "renders 400 when data is invalid", %{conn: conn} do
      assert_error_sent 404, fn ->
        delete conn, food_path(conn, :delete, 3)
      end
    end
  end

  defp create_food(_) do
    food = fixture(:food)
    {:ok, food: food}
  end
end
