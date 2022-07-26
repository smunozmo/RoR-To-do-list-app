Rails.application.routes.draw do
  
  devise_for :users

  resources :tasks do
    member do
      patch :change_status
    end
  end

  get 'users/:user_id/tasks', to: "users#tasks", as: "user_tasks"
  get 'users/:user_id/tags', to: "users#tags", as: "user_tags"
  get "users/:user_id/tags/:tag_id/tasks", to: "users#filter_tag", as: "filter_tag"
  get 'tasks/:id/change_status', to: "tasks#change_status", as: "change_status"

  
  get 'users/:user_id/tasks/new', to: "tasks#new", as: "new_task"
  post 'users/:user_id/tasks/new', to: "tasks#create", as: "create_task"
  
  get 'users/:user_id/tags/new', to: "tags#new", as: "new_tag"
  post 'users/:user_id/tags/new', to: "tags#create", as: "create_tag"


  # delete
  get 'users/:user_id/taggables', to: "users#taggables", as: "user_taggables" 
end
