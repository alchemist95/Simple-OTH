Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/sap', as: 'rails_admin'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'


  root 'static#home'
  get 'static/scoreboard'
  get 'static/error'
  get 'static/victory'

  resources :users, only: [:edit, :update]
end
