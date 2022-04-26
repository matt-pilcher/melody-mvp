Rails.application.routes.draw do
  root "songs#index"
  resources :songs do
    resources :phrases 
  end

  # User Authentication (Sorcery)
  get 'register', to: 'user_registrations#new'
  post 'register/user', to: 'user_registrations#create'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout', to: "user_sessions#destroy", as: :logout


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
