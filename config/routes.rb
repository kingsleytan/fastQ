Rails.application.routes.draw do

# for Braintree checkout
  get :checkout, to: "checkout#show"
  post :checkout, to: "checkout#payment"

#for Billpliz checkout
  scope '/webhooks', controller: :webhooks do
    post 'payment_callback', to: 'webhooks#payment_callback', as: :payment_callback
  end

end
