resources :teams do
  resources :assigns, only: %w(create destroy) do
    patch :transfer_owner, on: :member, controller: :teams
  end
  resources :agendas, shallow: true do
    resources :articles do
      resources :comments
    end
  end
end
