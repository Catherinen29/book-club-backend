Rails.application.routes.draw do

  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"
  
  # Match the /current_user path to the current_user controller's index action.
  get '/current_user', to: 'current_user#index'

  # Create the relevant routes for actions in the sessions & registrations controllers.
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Match each request & path to the relevant controllers & actions.
  # Relevant paths set up where user ID is required. 
  patch "/current_user", to: "current_user#update"
  get "/users/:id", to: "current_user#show"
 
  get "/books/reviews", to: "reviews#index"
  get "/books/:id/reviews", to: "reviews#show"
  post "/books/:id/reviews", to: "reviews#create"
  delete "/books/:id/reviews/:id", to: "reviews#destroy"
  
  get "/books", to: "books#index"
  get "books/:id", to: "books#show", as: :book
  post "/books", to: "books#create"
  patch "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"
  

end
