Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  get :about, to: 'static_pages#about'
  resources :offices do
    resources :branches
  end
  resources :services
  get :tickets
end
