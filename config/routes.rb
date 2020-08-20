Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/booking_confirmation', to: 'pages#confirm'
  resources :bookings, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :superheros do
     resources :bookings

    resources :reviews, only: [:new, :create]

  end
end
