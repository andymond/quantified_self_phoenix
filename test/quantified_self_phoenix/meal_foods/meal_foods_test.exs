defmodule QuantifiedSelfPhoenix.MealFoodsTest do
  use QuantifiedSelfPhoenix.DataCase
  alias QuantifiedSelfPhoenix.MealFoods

  describe "mealfoods" do
    alias QuantifiedSelfPhoenix.MealFoods.MealFood
    alias QuantifiedSelfPhoenix.Meals.Meal
    alias QuantifiedSelfPhoenix.Foods.Food
    alias QuantifiedSelfPhoenix.Repo

    @invalid_attrs %{}

    test "create_meal_food/1 with valid data creates a meal_food" do
      meal = Repo.insert!(%Meal{name: "lunch"})
      food = Repo.insert!(%Food{name: "meat"})
      assert {:ok, %MealFood{} = meal_food} = MealFoods.create_meal_food(%{food_id: food.id, meal_id: meal.id})
    end

    test "create_meal_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MealFoods.create_meal_food(@invalid_attrs)
    end

    test "delete_meal_food/1 deletes the meal_food" do
      meal = Repo.insert!(%Meal{name: "lunch"})
      food = Repo.insert!(%Food{name: "meat"})
      {:ok, %MealFood{} = meal_food} = MealFoods.create_meal_food(%{food_id: food.id, meal_id: meal.id})
      assert {:ok, %MealFood{}} = MealFoods.delete_meal_food(meal_food)
      assert nil == MealFoods.get_meal_food!(meal_food.id)
    end

    test "change_meal_food/1 returns a meal_food changeset" do
      meal = Repo.insert!(%Meal{name: "lunch"})
      food = Repo.insert!(%Food{name: "meat"})
      {:ok, %MealFood{} = meal_food} = MealFoods.create_meal_food(%{food_id: food.id, meal_id: meal.id})
      assert %Ecto.Changeset{} = MealFoods.change_meal_food(meal_food)
    end

    Repo.delete_all(Food)
    Repo.delete_all(Meal)
  end
end
