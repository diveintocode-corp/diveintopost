Rails.application.routes.draw do
  root 'users#dashboard'

  devise_for :users

  resources :users do
    get :dashboard, on: :collection
  end
end
