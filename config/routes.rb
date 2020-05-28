Rails.application.routes.draw do
  resources :urls
  resources :notes
  resources :sessions
  resources :tracks, only: [:create, :index,:update]
  resources :links
  resources :skills
  resources :users

  #custom user routes 
  post "users/sign-in", to: "users#sign_in"
  get "validate", to: "users#validate"

  #custom track routes 
  get "tracks/user-track", to: "tracks#user_track"
  get "tracks/user-tracks", to: "tracks#user_tracks"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
