Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :bikes do
    resources :reviews
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
