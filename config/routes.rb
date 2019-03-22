Rails.application.routes.draw do

  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy


  # Authentication routes
  resources :sessions
  resources :users
  get 'users/new', to: 'users#new', as: :signup
  get 'user/edit', to: 'users#edit', as: :edit_current_user
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout




  # Resource routes (maps HTTP verbs to controller actions automatically):
  resources :officers
  resources :units
  resources :investigations
  resources :investigation_notes
  resources :crimes
  resources :criminals
  resources :suspects
  resources :users
  resources :crime_investigations

  # Routes for assignments
  get 'assignments/new', to: 'assignments#new', as: :new_assignment
  post 'assignments', to: 'assignments#create', as: :assignments
  patch 'assignments/:id/terminate', to: 'assignments#terminate', as: :terminate_assignment

  # Toggle paths




  # Other custom routes
  patch 'suspects/:id/remove', to: 'suspects#remove', as: :remove_suspect
  patch 'investigations/:id/close', to: 'investigations#close', as: :close_investigation








  # Routes for searching
  post 'officers/search', to: 'officers#search', as: :officer_search
  post 'criminals/search', to: 'criminals#search', as: :criminal_search
  post 'investigations/search', to: 'investigations#search', as: :investigation_search



  # You can have the root of your site routed with 'root'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
