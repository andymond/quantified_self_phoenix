defmodule QuantifiedSelfPhoenix.MealFoods do
  @moduledoc """
  The MealFoods context.
  """

  import Ecto.Query, warn: false
  alias QuantifiedSelfPhoenix.Repo

  alias QuantifiedSelfPhoenix.MealFoods.MealFood

  @doc """
  Returns the list of mealfoods.

  ## Examples

      iex> list_mealfoods()
      [%MealFood{}, ...]

  """
  def list_mealfoods do
    Repo.all(MealFood)
  end

  @doc """
  Gets a single meal_food.

  Raises `Ecto.NoResultsError` if the Meal food does not exist.

  ## Examples

      iex> get_meal_food!(123)
      %MealFood{}

      iex> get_meal_food!(456)
      ** (Ecto.NoResultsError)

  """
  def get_meal_food!(id), do: Repo.get(MealFood, id)

  @doc """
  Finds a meal_food by food_id and meal_id.

  ## Examples

      iex> find_meal_food(%{field: value})
      {:ok, %MealFood{}}

      iex> find_meal_food(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def find_meal_food(attrs \\ %{}) do
    Repo.get_by!(MealFood, attrs)
  end

  @doc """
  Creates a meal_food.

  ## Examples

      iex> create_meal_food(%{field: value})
      {:ok, %MealFood{}}

      iex> create_meal_food(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_meal_food(attrs \\ %{}) do
    %MealFood{}
    |> MealFood.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a meal_food.

  ## Examples

      iex> update_meal_food(meal_food, %{field: new_value})
      {:ok, %MealFood{}}

      iex> update_meal_food(meal_food, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_meal_food(%MealFood{} = meal_food, attrs) do
    meal_food
    |> MealFood.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MealFood.

  ## Examples

      iex> delete_meal_food(meal_food)
      {:ok, %MealFood{}}

      iex> delete_meal_food(meal_food)
      {:error, %Ecto.Changeset{}}

  """
  def delete_meal_food(%MealFood{} = meal_food) do
    Repo.delete(meal_food)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking meal_food changes.

  ## Examples

      iex> change_meal_food(meal_food)
      %Ecto.Changeset{source: %MealFood{}}

  """
  def change_meal_food(%MealFood{} = meal_food) do
    MealFood.changeset(meal_food, %{})
  end
end
