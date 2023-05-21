Rails.application.routes.draw do
  get 'orders/index'
  resources :products
  resources :orders
  root 'main#index'
  
end
