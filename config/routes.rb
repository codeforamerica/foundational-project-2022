Rails.application.routes.draw do

  root "benefits_apps#index"
  resources :benefits_apps do
    resources :members

  end
  resources :benefits_apps do
    resources :incomes
  end

  patch "benefits/:id/update_date" => "benefits_apps#update_date", :as => "update_date"
  patch "benefits/:id/add_income" => "benefits_apps#add_income", :as => "add_income"
  mount Cfa::Styleguide::Engine => "/cfa"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
