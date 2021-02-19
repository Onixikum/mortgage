Rails.application.routes.draw do
  root 'banks#index'

  resources :banks
  resources :calculations
end
