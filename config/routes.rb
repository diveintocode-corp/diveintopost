Rails.application.routes.draw do
  root 'users#dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :users, except: [:edit] do
    get :dashboard, on: :collection
  end
  resource :user, only: :edit
  resources :articles, shallow: true do
    resources :comments, only: [:create, :update, :destroy]
  end
end
