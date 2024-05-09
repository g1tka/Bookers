Rails.application.routes.draw do
  root to: 'homes#top'
#  get 'books/index'
#  get 'books/show'
#  get 'books/edit'
#  get 'homes/top'
  resources :books, except: [:show, :edit, :destroy, :new]
  get "books/:id" => 'books#show', as: 'show_book'
  get "books/:id/edit" => 'books#edit', as: 'edit_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
