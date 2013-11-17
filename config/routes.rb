FunFort::Application.routes.draw do

  resources :messages

  get 'signup', to: 'parents#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :children
  resources :parents
  resources :sessions
  resources :friendships

end
