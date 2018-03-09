Rails.application.routes.draw do


  get 'messages/reply'

# social media marketer
#
#   authenticated :user, -> user { user.admin? } do
    mount Delayed::Web::Engine, at: '/jobs'
  # end

  get 'auth/:provider/callback', to: 'connections#create'
  resources :connections, only: [:destroy]
  resources :posts do
    member do
      put :cancel
    end
  end

# end of social media marketer

#advertisements start

  # resources :advertisements
#advertisements end


# Start of "seller store"
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'

  resources :products

  #store bug
  # resources :store_purchases, only: [:show]
  #end of store bug
# end of "seller store"

# Start of user subscription
  get 'user/choose_type', to: 'user#choose_type', as: 'choose_type'
  patch 'user/update_type', to: 'user#update_type', as: 'update_type'
# end of user subscription

# # Start of mortgage calculator
   resources :calculators
# # end of mortgage claculator

# start of Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'calendar/show'

  resources :locks

  resources :charges, only: [:new, :create]
    post '/store_charges', to: 'charges#store_purchase', as: 'store_charges'
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



  resource :messages do
    collection do
      post 'reply'
    end
  end

end
