Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :item_orders
      resources :orders do 
        collection do
          get :active_cart
        end

      end

      resources :items
      resources :users
      post "/login", to: "users#login"
      post "/users", to: "users#create"
      get "/auto_login", to: "users#auto_login"
      patch "/orders/:id/transform", to: "orders#transform"
    end
  end
      

end
