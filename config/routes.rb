Rails.application.routes.draw do
  resources :book
  resources :user, only: [:create, :show]
  resources :reading_list
  post 'login', to: 'auth#create', as: '/login'
  get 'myuser', to: 'auth#show', as: '/myuser'

  patch 'complete', to: 'book#update', as: '/complete'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
