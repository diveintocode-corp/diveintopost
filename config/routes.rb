Rails.application.routes.draw do
  root 'statics#top'
  get :dashboard, to: 'teams#dashboard'
  get :select_team, to:'users#select_team'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resource :user

  resources :teams do
    resources :assigns, only: %w(create destroy)
    resources :agendas, shallow: true do
      resources :articles
    end
  end
end
