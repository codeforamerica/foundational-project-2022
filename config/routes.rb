Rails.application.routes.draw do

  root "benefits_apps#index"
  resources :benefits_apps do
    resources :members
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
