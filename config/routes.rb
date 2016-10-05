Rails.application.routes.draw do

root to: 'landing#index'
get :about, to: 'static_pages#about'

resources :offices, except: [:show] do
  resources :branches do
    resources :services
  end
end
resources :tickets
resources :products

resources :users, only: [:show, :new, :edit, :create, :update]
resources :sessions, only: [:new, :create, :destroy]
resources :password_resets, only: [:new, :create, :edit, :update]

# for Braintree checkout
  get :checkout, to: "checkout#show"
  post :checkout, to: "checkout#payment"

#for Billpliz checkout
  scope '/webhooks', controller: :webhooks do
    post 'payment_callback', to: 'webhooks#payment_callback', as: :payment_callback
  end

end
