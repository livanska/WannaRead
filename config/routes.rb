Rails.application.routes.draw do
  
  devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'books#index'
#match 'user/books',  to: 'user/books#index',         via: 'get'
get get 'book' => 'books#user_books', :as => :user_books
resources :books do
  resources :likes
end
resources :tags, only: [:show]
resources :users do
  member do
    get :books
  end
end
end
