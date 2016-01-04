Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :restaurants, :controllers => { registrations: 'restaurant/registrations' }

  root 'restaurants#index'

  get '/restaurants/sign_in' => 'devise/sessions#new'
  get '/restaurants/profile' => 'restaurants#show'
  post '/restaurants/city' => 'restaurants#city'
  post '/restaurants/neighborhood' => 'restaurants#neighborhood'

  resources :restaurants, only: [:index, :show, :update] do
    resources :gifts, only: [:new, :create]
  end


  resources :menu_items, only: [:destroy, :create, :update]
  resources :users, only: [:create]
  resources :gifts, only: [:show, :update]
  resources :transactions, only: [:new, :create]



  get '/login' => 'user_sessions#new'
  post '/users/sessions' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy'
  get '/profile' => 'users#show'
  get '/register' => 'users#new'
  get '/confirmation/:id' => 'gifts#confirm', as: "confirmation"

  get '/redemption_confirmation/:id' => 'gifts#confirm_redemption', as: "redemption_confirmation"

  post '/restaurants/sessions' => 'restaurant_sessions#create'
  delete '/restaurants/logout' => 'restaurant_sessions#destroy'


end
