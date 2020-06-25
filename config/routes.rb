Rails.application.routes.draw do
  get "venues/my_own", to: "venues#my_own", as: :my_own
  resources :venues do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
