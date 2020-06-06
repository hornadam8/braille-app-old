Rails.application.routes.draw do
  root 'welcome#home'
  get '/signin/student', to: 'sessions#new_student'
  get '/signin/teacher', to: 'sessions#new_teacher'
  post '/signin/student', to: 'sessions#create_student'
  post '/signin/teacher', to: 'sessions#create_teacher'
  get '/signup/student', to: 'students#new'
  get '/signup/teacher', to: 'teachers#new'
  post '/signup/student', to: 'students#create'
  post '/signup/teacher', to: 'teachers#create'
  resources :papers
  resources :assignments
  resources :cohorts
  resources :students
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
