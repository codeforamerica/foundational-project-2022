Rails.application.routes.draw do
  resources :benefits_apps

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "benefits_apps#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
