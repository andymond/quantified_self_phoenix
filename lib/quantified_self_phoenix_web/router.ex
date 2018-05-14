defmodule QuantifiedSelfPhoenixWeb.Router do
  use QuantifiedSelfPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", QuantifiedSelfPhoenixWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api/v1", QuantifiedSelfPhoenixWeb do
    pipe_through :api

    resources "/foods", FoodController, except: [:new, :edit]
    resources "/meals", MealController, except: [:new, :edit, :delete, :show]
    get "/meals/:id/foods", MealController, :show
    post "/meals/:meal_id/foods/:id", MealFoodController, :create
    delete "/meals/:meal_id/foods/:id", MealFoodController, :delete
  end
end
