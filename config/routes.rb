Rails.application.routes.draw do


  root 'restaurants#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :restaurants, :controllers => { registrations: 'restaurant/registrations' }

  get '/restaurants/login' => 'restaurant_sessions#new'
  get '/restaurants/profile' => 'restaurants#show'
  post '/restaurants/city' => 'restaurants#city'
  post '/restaurants/neighborhood' => 'restaurants#neighborhood'

  resources :restaurants, only: [:index, :show] do
    resources :gifts, only: [:new, :create, :update]
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



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
