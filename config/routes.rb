Rails.application.routes.draw do
  resources :token_transactions, only: [:index]
  root 'token_transactions#index'
end
