Rails.application.routes.draw do
  
  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'favorites/update'
  get 'recipes/favorites'
  
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :users, only: [:show] do
    member do 
      get 'recipes', to: 'users#recipes'
      patch 'change_status', to: 'users#change_status' # patch :change_status
    end
  end
  resources :categories
  resources :tags, only: [:show]
  resources :recipes do
    resources 'reviews', only: [:index, :new, :create]
    resources 'comments', only: [:create, :destroy] do 
      member do
        patch "upvote", to: "comments#upvote"
        patch "downvote", to: "comments#downvote"
      end
    end
  end
  
  match "/404", via: :all, to: "errors#not_found"
  match "/500", via: :all, to: "errors#internal_server_error"
  
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
