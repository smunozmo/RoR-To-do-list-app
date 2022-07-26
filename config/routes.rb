Rails.application.routes.draw do
  devise_for :users
  get 'users/:user_id/tasks', to: "user#tasks", as: "user_tasks"
  get 'users/:user_id/tasks/new', to: "task#new", as: "new_task"
  post 'users/:user_id/tasks/new', to: "task#create", as: "create_task"
end
