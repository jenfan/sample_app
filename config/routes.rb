SampleApp::Application.routes.draw do
  resources :sessions , only: [:new, :create, :destroy]
  resources :users
  root to: 'static_pages#home'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  match '/signout', to: 'session#destroy', via: 'delete'
  get '/signin', to: 'session#new'
  get '/signup', to: 'users#new'
