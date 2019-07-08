# == Route Map
#
# I, [2019-07-07T22:56:16.739952 #13826]  INFO -- sentry: ** [Raven] Raven 2.7.4 ready to catch errors
#                                           Prefix Verb  URI Pattern                                                                                Controller#Action
#                                     admin_orders GET   /admin/orders(.:format)                                                                    v1/admin/orders#index
#                                                  POST  /admin/orders(.:format)                                                                    v1/admin/orders#create
#                                      admin_order PATCH /admin/orders/:id(.:format)                                                                v1/admin/orders#update
#                                                  PUT   /admin/orders/:id(.:format)                                                                v1/admin/orders#update
# admin_product_row_material_product_row_materials POST  /admin/products/:product_id/row_materials/:row_material_id/product_row_materials(.:format) v1/admin/product_row_materials#create
#        admin_category_row_material_row_materials POST  /admin/category_row_materials/:category_row_material_id/row_materials(.:format)            v1/admin/row_materials#create
#                               admin_row_material PATCH /admin/row_materials/:id(.:format)                                                         v1/admin/row_materials#update
#                                                  PUT   /admin/row_materials/:id(.:format)                                                         v1/admin/row_materials#update
#                     admin_category_row_materials GET   /admin/category_row_materials(.:format)                                                    v1/admin/category_row_materials#index
#                                       auth_login POST  /auth/login(.:format)                                                                      authentication#authenticate
#                                           signup POST  /signup(.:format)                                                                          users#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    namespace :admin do
      resources :orders, only: [:create, :index, :update]
      resources :products, only: [] do
        resources :row_materials, only: [] do 
          resources :product_row_materials, only: [:create]
        end
      end
      resources :category_row_materials, only: [:index] do
        resources :row_materials, only: [:create]
        resources :row_materials, only: [:update], shallow: true
      end
    end
    
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
