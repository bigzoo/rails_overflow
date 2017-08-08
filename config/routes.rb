Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'upvote', to: 'questions#upvote', as: 'upvote'
  get 'upvote_answer', to: 'answers#upvote', as: 'upvote_answer'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  root 'main#index'
  resources :users
  resources :sessions
  resources :questions do
    resources :answers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
