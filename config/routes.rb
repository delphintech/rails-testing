Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  root to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
