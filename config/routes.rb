Rails.application.routes.draw do
  root to: 'lists#home'
  resources :lists, only: [:show, :index, :new, :create] do
    resources :bookmarks, only: [:create]
  end

  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:index, :create, :new, :destroy]

  post '/movies/search', to: 'movies#search', as: :search_movie
end
