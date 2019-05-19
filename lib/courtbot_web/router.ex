defmodule CourtbotWeb.Router do
  use CourtbotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CourtbotWeb do
    pipe_through :api

    get "/csv/:count", CsvController, :idaho
  end
end
