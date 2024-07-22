Rails.application.routes.draw do
  get 'users/my_portfolio'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  get "my_portfolio", to: "users#my_portfolio"
  get "search_stock", to: "stocks#search"
end
