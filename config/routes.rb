FunFort::Application.routes.draw do

  resources :invitations

  resources :messages

  get 'signup', to: 'parents#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'approvals/:id/confirm' => 'approvals#confirm'
  get 'approvals/:id/reject' => 'approvals#reject'
  get 'approvals/:id/confirm_receipt' => 'approvals#confirm_receipt'
  get 'approvals/thanks', to: 'approvals#thanks'
  get 'invitations/:secret_code/accept', to: 'invitations#accept'

  resources :children
  resources :parents
  resources :sessions
  resources :friendships

end
