Rails.application.routes.draw do
  
  devise_for :users
  get 'users/:user_id/tasks', to: "users#tasks", as: "user_tasks"
  get 'users/:user_id/tags', to: "users#tags", as: "user_tags"
  
  get 'users/:user_id/tasks/new', to: "tasks#new", as: "new_task"
  post 'users/:user_id/tasks/new', to: "tasks#create", as: "create_task"
  
  get 'users/:user_id/tags/new', to: "tags#new", as: "new_tag"
  post 'users/:user_id/tags/new', to: "tags#create", as: "create_tag"

  # delete
  get 'users/:user_id/taggables', to: "users#taggables", as: "user_taggables" 
end
