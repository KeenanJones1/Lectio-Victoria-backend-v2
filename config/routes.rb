Rails.application.routes.draw do
  resources :book, only: [:index, :create, :show, :destroy]
  resources :user, only: [:create, :show]
  resources :reading_list
  post 'login', to: 'auth#create', as: '/login'
  get 'myuser', to: 'auth#show', as: '/myuser'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
