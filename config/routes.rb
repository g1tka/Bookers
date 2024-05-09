Rails.application.routes.draw do
  root to: 'homes#top'
  resources :books, except: [:show, :edit, :destroy, :new]

  get "books/:id" => 'books#show', as: 'show_book'
  get "books/:id/edit" => 'books#edit', as: 'edit_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end

  # Prefix        Verb      URI Pattern                 Controller#Action
  #  root         GET       /                             homes#top
  #  books        GET       /books(.:format)              books#index
  #               POST      /books(.:format)              books#create
  #  book         PATCH     /books/:id(.:format)          books#update
  #               PUT       /books/:id(.:format)          books#update
  # show_book     GET       /books/:id(.:format)          books#show
  # edit_book     GET       /books/:id/edit(.:format)     books#edit
  #destroy_book   DELETE    /books/:id(.:format)          books#destroy