Rails.application.routes.draw do

  root "benefits_apps#index"
  resources :benefits_apps do
    resources :members

  end
  resources :benefits_apps do
    resources :incomes
      member do
        get "incomes/you_qualify" => "incomes#you_qualify", :as => "you_qualify"
        get "incomes/you_do_not_qualify" => "incomes#you_do_not_qualify", :as => "you_do_not_qualify"
      end
  end

  resources :benefits_apps do
    collection do
      get "/:id/add_income" => "benefits_apps#add_income", :as => "add_income"
      get "/:id/not_employed" => "benefits_apps#not_employed", :as => "not_employed"
    end
  end


  resources :has_incomes, only:[:edit,:update]
  patch "benefits/:id/update_date" => "benefits_apps#update_date", :as => "update_date"

  mount Cfa::Styleguide::Engine => "/cfa"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
