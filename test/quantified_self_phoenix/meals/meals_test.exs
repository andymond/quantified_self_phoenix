defmodule QuantifiedSelfPhoenix.MealsTest do
  use QuantifiedSelfPhoenix.DataCase

  alias QuantifiedSelfPhoenix.Meals

  describe "meals" do
    alias QuantifiedSelfPhoenix.Meals.Meal

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def meal_fixture(attrs \\ %{}) do
      {:ok, meal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Meals.create_meal()

      meal
    end

    test "list_meals/0 returns all meals" do
      meal = meal_fixture()
      assert Meals.list_meals() == [meal]
    end

    test "get_meal!/1 returns the meal with given id" do
      meal = meal_fixture()
      assert Meals.get_meal!(meal.id) == meal
    end

    test "create_meal/1 with valid data creates a meal" do
      assert {:ok, %Meal{} = meal} = Meals.create_meal(@valid_attrs)
      assert meal.name == "some name"
    end

    test "create_meal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meals.create_meal(@invalid_attrs)
    end

    test "update_meal/2 with valid data updates the meal" do
      meal = meal_fixture()
      assert {:ok, meal} = Meals.update_meal(meal, @update_attrs)
      assert %Meal{} = meal
      assert meal.name == "some updated name"
    end

    test "update_meal/2 with invalid data returns error changeset" do
      meal = meal_fixture()
      assert {:error, %Ecto.Changeset{}} = Meals.update_meal(meal, @invalid_attrs)
      assert meal == Meals.get_meal!(meal.id)
    end

    test "delete_meal/1 deletes the meal" do
      meal = meal_fixture()
      assert {:ok, %Meal{}} = Meals.delete_meal(meal)
      assert_raise Ecto.NoResultsError, fn -> Meals.get_meal!(meal.id) end
    end

    test "change_meal/1 returns a meal changeset" do
      meal = meal_fixture()
      assert %Ecto.Changeset{} = Meals.change_meal(meal)
    end
  end
end
