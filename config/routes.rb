Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :destroy, to: 'sessions#destroy'
  get :show, to: 'sessions#show'

  resources :massages, only: [:index, :show, :create, :update, :destroy]

  resources :appointments, only: [:index, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
