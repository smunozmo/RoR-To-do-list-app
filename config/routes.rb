Rails.application.routes.draw do
  
  devise_for :users

  resources :tasks, except: :new do
    member do
      patch :change_status
    end
  end

  root 'users#tasks'

  get 'users/:user_id/all_tasks', to: "users#all_tasks", as: "all_tasks"
  get 'users/:user_id/tasks', to: "users#tasks", as: "user_tasks"
  
  get 'tasks/:id/change_status', to: "tasks#change_status", as: "change_status"
  get 'users/:user_id/tasks/new', to: "tasks#new", as: "new_task"
  post 'users/:user_id/tasks/new', to: "tasks#create", as: "create_task"
  
  get 'users/:user_id/tags/new', to: "tags#new", as: "new_tag"
  post 'users/:user_id/tags/new', to: "tags#create", as: "create_tag"

end
