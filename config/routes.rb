Fels3::Application.routes.draw do
  resources :users do
    resources :lessons, only: [:new, :show, :index]
  end
  resources :words
  resources :lessons
  resources :sessions, only: [:new, :create, :destroy]
  resources :lessons do
    resources :results
  end

  namespace :admin do
    resources "sessions", only: [:new, :create, :destroy]
    resources :users
    resources :words
    resources :categories
    match "/signin", to: "sessions#new", via: "get"
    match "/signout", to: "sessions#destroy", via: "delete"
  end
  
  resources :categories, only: [:new, :show, :index]
  resources :lessons, only: [:new, :show, :index]
  root  'static_pages#home'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
    
end