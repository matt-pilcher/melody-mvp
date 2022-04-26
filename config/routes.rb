Rails.application.routes.draw do
  root "songs#index"
  resources :songs do
    resources :phrases 
  end

  get 'register', to: 'user_registrations#new'
  post 'register/user', to: 'user_registrations#create'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
