Rails.application.routes.draw do


# social media marketer

  authenticated :user, -> user { user.admin? } do
    mount Delayed::Web::Engine, at: '/jobs'
  end

  get 'auth/:provider/callback', to: 'connections#create'
  resources :connections, only: [:destroy]
  resources :posts do
    member do
      put :cancel
    end
  end

# end of social media marketer
  
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'

  resources :products

  get 'user/choose_type', to: 'user#choose_type', as: 'choose_type'

  patch 'user/update_type', to: 'user#update_type', as: 'update_type'

  resources :calculators

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'calendar/show'

  resources :locks

  resources :charges, only: [:new, :create]
  resources :add_offers

  devise_for :users
  get 'welcome/index'
  get 'dashboard'  => 'welcome#dashboard', as: :dashboard
  resources :properties do
    get 'saved_search' => 'properties#saved_search', as: :saved_search, on: :collection
    resources :comments do

    end
    resources :slots do
      get 'start_time' => 'property/show'
      resources :appointments do
        get 'lock' => 'appointments#lock', as: :lock
        get 'unlock' => 'appointments#unlock', as: :unlock
      end
      delete 'by_day/:day', to: 'slots#by_day', on: :collection, as: 'by_day'
    end
    resources :favorites, only: [:create, :destroy]
    resources :add_offers do
      get 'price' => 'property/show'
    end
  end
  resources :subscribers
  get 'auth/failure', to: 'connections#omniauth_failure'

  resources :locks do
    get :lock, on: :member
    get :unlock, on: :member
  end

  get 'welcome/about'
  root to: 'welcome#index'
  

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
