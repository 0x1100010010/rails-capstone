Rails.application.routes.draw do
  root to: 'users#index'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  scope :sessions do
    get 'signup', to: 'users#new'
    get 'signin', to: 'sessions#new'
    get 'signout', to: 'sessions#destroy'
  end
end
