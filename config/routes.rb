# == Route Map
#
# I, [2019-10-12T12:30:35.345259 #14191]  INFO -- sentry: ** [Raven] Raven 2.11.0 ready to catch errors
#                                           Prefix Verb   URI Pattern                                                                                Controller#Action
#                                     admin_orders GET    /admin/orders(.:format)                                                                    v1/admin/orders#index
#                                                  POST   /admin/orders(.:format)                                                                    v1/admin/orders#create
#                                      admin_order PATCH  /admin/orders/:id(.:format)                                                                v1/admin/orders#update
#                                                  PUT    /admin/orders/:id(.:format)                                                                v1/admin/orders#update
# admin_product_row_material_product_row_materials POST   /admin/products/:product_id/row_materials/:row_material_id/product_row_materials(.:format) v1/admin/product_row_materials#create
#                       admin_product_row_material PATCH  /admin/product_row_materials/:id(.:format)                                                 v1/admin/product_row_materials#update
#                                                  PUT    /admin/product_row_materials/:id(.:format)                                                 v1/admin/product_row_materials#update
#                                                  DELETE /admin/product_row_materials/:id(.:format)                                                 v1/admin/product_row_materials#destroy
#        admin_category_row_material_row_materials POST   /admin/category_row_materials/:category_row_material_id/row_materials(.:format)            v1/admin/row_materials#create
#                               admin_row_material PATCH  /admin/row_materials/:id(.:format)                                                         v1/admin/row_materials#update
#                                                  PUT    /admin/row_materials/:id(.:format)                                                         v1/admin/row_materials#update
#                     admin_category_row_materials GET    /admin/category_row_materials(.:format)                                                    v1/admin/category_row_materials#index
#                                                  POST   /admin/category_row_materials(.:format)                                                    v1/admin/category_row_materials#create
#                  admin_category_product_products POST   /admin/category_products/:category_product_id/products(.:format)                           v1/admin/products#create
#                                    admin_product PATCH  /admin/products/:id(.:format)                                                              v1/admin/products#update
#                                                  PUT    /admin/products/:id(.:format)                                                              v1/admin/products#update
#                          admin_category_products GET    /admin/category_products(.:format)                                                         v1/admin/category_products#index
#                                                  POST   /admin/category_products(.:format)                                                         v1/admin/category_products#create
#                                       auth_login POST   /auth/login(.:format)                                                                      authentication#authenticate
#                                           signup POST   /signup(.:format)                                                                          users#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    namespace :admin do
      resources :orders, only: %i[create index update]

      resources :products, only: [] do
        resources :row_materials, only: [] do
          resources :product_row_materials, only: [:create]
          resources :product_row_materials, only: %i[update destroy], shallow: true
        end
      end

      resources :category_row_materials, only: %i[index create] do
        resources :row_materials, only: [:create]
        resources :row_materials, only: %i[update destroy], shallow: true
      end

      resources :category_products, only: %i[index create] do
        resources :products, only: [:create]
        resources :products, only: %i[update destroy], shallow: true
      end

      resources :product_reports, only: :index
      resources :row_material_reports, only: :index

      resources :loans, only: %i[create index] do
        resources :fees, only: [:index]
      end

      resources :employers, only: %i[create index update]
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
