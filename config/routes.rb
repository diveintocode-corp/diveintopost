Rails.application.routes.draw do
  resource :user, only: [:show]
end
