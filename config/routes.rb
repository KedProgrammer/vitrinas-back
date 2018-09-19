# == Route Map
#
#        Prefix Verb  URI Pattern                  Controller#Action
# orders_orders GET   /orders/orders(.:format)     v1/orders/orders#index
#               POST  /orders/orders(.:format)     v1/orders/orders#create
#  orders_order PATCH /orders/orders/:id(.:format) v1/orders/orders#update
#               PUT   /orders/orders/:id(.:format) v1/orders/orders#update
#               GET   /orders/orders(.:format)     v1/orders/orders#show
#    auth_login POST  /auth/login(.:format)        authentication#authenticate
#        signup POST  /signup(.:format)            users#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    namespace :orders do
      resources :orders, only: [:create, :index, :update]
    end
    
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
