Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'

  resources :games do
    collection do
      get 'show_details'
    end
    post 'create_comment', on: :member
  end
end
