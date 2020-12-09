Rails.application.routes.draw do
  resources :books, only: [:index, :create, :show]
  resources :auth, only: [:create, :show]
  resources :user, only: [:create, :show]
  resources :reading_list
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
