Rails.application.routes.draw do
  root 'statics#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :teams do
    resources :assigns, only: %w(create)
  end
end
