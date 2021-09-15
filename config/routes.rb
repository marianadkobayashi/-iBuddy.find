Rails.application.routes.draw do
  devise_for :users

  resources :events do
    resources :chatrooms, only: :create
    collection do
      get :my_events
    end
  end

  resources :event_days, only: [] do
    resources :bookings, only: [:create, :index]
  end

  resources :users, only: :show do
  end
  resources :reviews

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
