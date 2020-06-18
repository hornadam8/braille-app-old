Rails.application.routes.draw do
  
  resources :admins
  resources :schools
  root 'welcome#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/logout', to: 'sessions#logout'


  resources :users

  scope :teacher do
    resources :cohorts, only: [:new,:create,:edit,:update,:show,:destroy,:index]
    resources :assignments, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :papers, only: [:show,:index]
  end

  scope :student do
    resources :papers, only: [:new, :create, :edit, :update, :show, :index, :destroy]
    resources :cohorts, only: [:show, :index]
    resources :assignments, only: [:show,:index]
    get '/cohorts/add', to: 'cohorts#add'
    post '/cohorts/join', to: 'cohorts#join'
  end

  resources :admin, only: [:show, :new, :create, :update, :edit, :destroy] do
  end

  resources :schools, only: [:show]
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
