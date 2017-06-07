Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }
  root 'trips#index'

  resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
  end

end
