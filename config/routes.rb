Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  get 'help', to: 'static_pages#help'

  get '/signup',     to: 'users#new'
  post '/signup',    to: 'users#create'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end