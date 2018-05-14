defmodule QuantifiedSelfPhoenix.Repo.Migrations.CreateMealfoods do
  use Ecto.Migration

  def change do
    create table(:mealfoods) do
      add :meal_id, references(:meals, on_delete: :nothing)
      add :food_id, references(:foods, on_delete: :nothing)

      timestamps()
    end

    create index(:mealfoods, [:meal_id])
    create index(:mealfoods, [:food_id])
  end
end
