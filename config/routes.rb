Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/booking_confirmation', to: 'pages#confirm'
  resources :bookings, only: [:index]
  get '/me', to: "users#index", as: :me
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :superheros do
     resources :bookings
     resource :favorite, only: [:create, :destroy]
    resources :reviews, only: [:new, :create]
  end

end
