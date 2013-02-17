Pollster::Application.routes.draw do
  root to: 'polls#index'

  resources :polls
  resources :votes, only: [:create]

end
