Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  get 'movies/theatres_for_movie/:id', to: 'movies#theatres_for_movie'
  get 'shows/index/:id', to:'shows#index'
  get 'movies/id', to:'movies#show'
  post 'seats/index/:id', to: 'seats#index'
  get 'seats/hello/:id', to: 'seats#hello'
  post 'payments/calculate_amount', to: 'payments#calculate_amount'
  post '/create_customer', to: 'payments#create_customer'
  # post 'payments/create', to: 'payments#create'
  resources :theatres
  resources :movies
  resources :users
  resource :seats
  resources :payments
  post '/auth/login', to: 'authentication#login'
  # Defines the root path route ("/")
  # root "posts#index"

 
end
