Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'upvote', to: 'questions#upvote', as: 'upvote'
  get 'upvote_answer', to: 'answers#upvote', as: 'upvote_answer'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  root 'main#index'
  get 'admin', to: 'admin#index', as: 'admin'
  post 'admin', to: 'admin#create', as: 'adminify'
  delete 'admin', to: 'admin#delete', as: 'delete'
  post 'deadmin', to: 'admin#remove', as: 'deadmin'
  resources :users
  resources :sessions
  resources :questions do
    resources :answers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
