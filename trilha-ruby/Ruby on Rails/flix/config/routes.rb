Rails.application.routes.draw do

  resources :reviews
  root "movies#index"

  # get "movies" => "movies#index"
  # get "movies/new" => "movies#new", as: "new_movie"
  # get "movies/:id" => "movies#show", as: "movie"
  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"

  get "movies/upcoming" => "movies#upcoming", as: "upcoming_movie"
  resources :movies


end
