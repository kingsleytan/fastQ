Rails.application.routes.draw do

root to: 'landing#index'
get :about, to: 'static_pages#about'

# for Braintree checkout
  get :checkout, to: "checkout#show"
  post :checkout, to: "checkout#payment"

#for Billpliz checkout
  scope '/webhooks', controller: :webhooks do
    post 'payment_callback', to: 'webhooks#payment_callback', as: :payment_callback
  end

end
