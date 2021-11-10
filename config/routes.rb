Rails.application.routes.draw do
  resources :plots, only: [:index]
  resources :plant_plots, only: [:destroy]
  resources :gardens, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
