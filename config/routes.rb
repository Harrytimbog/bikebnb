Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#index'

  resources :bikes
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
