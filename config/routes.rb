Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :plots, only: [:index]
  resources :plot_plants, only: [:update]

  resources :gardens, only: [:show] do
    resources :plots, only: [:index]
  end
end
