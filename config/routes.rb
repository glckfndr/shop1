Rails.application.routes.draw do
  root 'main#index'
  
  resources :products
  resources :orders
  
  
end
