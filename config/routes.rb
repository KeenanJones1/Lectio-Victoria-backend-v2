Rails.application.routes.draw do
  get 'reading_list/index'
  get 'reading_list/create'
  get 'reading_list/new'
  get 'reading_list/show'
  get 'reading_list/edit'
  get 'reading_list/update'
  get 'reading_list/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
