Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "registration#new"
  get '/sign_up', to: 'registration#new', as: :new_user
  get '/login', to: 'registration#login', as: :login_user
  post '/login', to: 'registration#login_create', as: :login_create_user
  post '/create', to: 'registration#create', as: :create_user
  delete '/logout', to: 'registration#logout', as: :logout_user

  get '/new_todo', to: 'todo#new', as: :new_todo
  post '/create_todo', to: 'todo#create', as: :create_todo
  patch '/mark_complete/:id', to: 'todo#mark_complete', as: :mark_complete_todo
  delete '/delete_todo/:id', to: 'todo#destroy', as: :delete_todo

  root to: 'home#index', as: :index_user
end
