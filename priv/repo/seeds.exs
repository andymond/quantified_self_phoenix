# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias QuantifiedSelfPhoenix.Repo
alias QuantifiedSelfPhoenix.Meals.Meal
alias QuantifiedSelfPhoenix.Foods.Food
alias QuantifiedSelfPhoenix.MealFoods.MealFood

Repo.delete_all(MealFood)
Repo.delete_all(Meal)
Repo.delete_all(Food)

Repo.insert!(%Meal{id: 1, name: "breakfast"})
Repo.insert!(%Meal{id: 2, name: "snack"})
Repo.insert!(%Meal{id: 3, name: "lunch"})
Repo.insert!(%Meal{id: 4, name: "dinner"})

Repo.insert!(%Food{id: 1, name: "cheerios"})
Repo.insert!(%Food{id: 2, name: "apple"})
Repo.insert!(%Food{id: 3, name: "green curry"})
Repo.insert!(%Food{id: 4, name: "cold spam"})

Repo.insert!(%MealFood{meal_id: 1, food_id: 1})
Repo.insert!(%MealFood{meal_id: 2, food_id: 2})
Repo.insert!(%MealFood{meal_id: 3, food_id: 3})
Repo.insert!(%MealFood{meal_id: 4, food_id: 4})
