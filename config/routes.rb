Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks

  namespace :api do
    namespace :v1 do
      resources :tasks, only: [ :index ]
    end
  end
end
