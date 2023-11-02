Rails.application.routes.draw do
  root 'users#upload'
  resources :users, only: [] do
    collection do
      get 'upload'
      post 'import'
    end
    get 'display_users', on: :collection
  end
end