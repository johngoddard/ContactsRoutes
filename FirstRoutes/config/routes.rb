Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]

  resources :users do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
    member do
      get 'favorites'
    end

    resources :groups, only: [:index]

  end

  resources :groups, only: [:create, :destroy, :update, :show]
  resources :comments, only: [:create, :destroy]

  resources :contacts, only: [ :show, :create, :update, :destroy]
  resources :contacts do
    resources :comments, only: [:index]
  end

  resources :contact_shares, only: [:create, :destroy]

  resources :group_memberships, only: [:create, :destroy]

  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id' , to: 'users#show', as: 'user'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # delete '/users/:id', to: 'users#destroy'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # get '/users/:id/edit',  to: 'users#edit', as: 'edit_user'
end
