Rails.application.routes.draw do
  resources :links
  resources :skills
  resources :users

  #custom user routes 
  post "users/sign-in", to: "users#sign_in"
  get "validate", to: "users#validate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
