Rails.application.routes.draw do
  resources :books, only: [index, create, show]
  resoures :auth, only: [create, show]
  resources :user, only: [create]
  resources :reading_list
  get 'book/index'
  get 'user/create'
  get 'auth/create'
  get 'auth/show'
  get 'reading_list/index'
  get 'reading_list/create'
  get 'reading_list/new'
  get 'reading_list/show'
  get 'reading_list/edit'
  get 'reading_list/update'
  get 'reading_list/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
