Pollster::Application.routes.draw do
  root to: 'polls#index'

  resources :polls
  resources :items, only: [] do
    resources :votes, only: [:create]
  end

end
