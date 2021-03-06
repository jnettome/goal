Mygoal::Application.routes.draw do
  resources :form_parqs, except: :index

  # User authentication
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  resources :user_sessions, only: [:new, :create, :destroy]

  # Users registration and panel
  resources :users
  resources :students, :controller => 'users'
  resources :teachers, :controller => 'users'

  # Teachers
  resources :trainings

  get "enrollments/search"
  get "enrollments/users"
  post "enrollments/enroll"
  resources :enrollments, only: [:index]


  # Project index
  get "home/welcome"
  root 'home#welcome'
end
