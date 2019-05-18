Rails.application.routes.draw do
  root 'statics#top'

  draw :users
  draw :dashboard
  draw :teams

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
