Rails.application.routes.draw do
  resources :favourites
  resources :links
  resources :topic_skills
  resources :topics
  resources :skills
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
