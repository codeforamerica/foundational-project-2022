Rails.application.routes.draw do

  root "benefits_apps#index"
  resources :benefits_apps do
    resources :members

  end
  resources :benefits_apps do
    resources :incomes
  end

  resources :benefits_apps do
    collection do
      get "/:id/add_income" => "benefits_apps#add_income", :as => "add_income"
    end
  end

  patch "benefits/:id/employed" => "benefits_apps#employed", :as => "employed"

  patch "benefits/:id/update_date" => "benefits_apps#update_date", :as => "update_date"
  # get "benefits_apps/:id/add_income" => "benefits_apps#add_income", :as => "add_income"
  get "benefits_apps/:id/incomes/income_info", to: "incomes#income_info", :as => "income_info"
  mount Cfa::Styleguide::Engine => "/cfa"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
