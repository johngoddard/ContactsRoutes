Rails.application.routes.draw do
  # resources :users
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id' , to: 'users#show', as: 'user'
  get '/users/new', to: 'users#new', as: 'new_user'
  delete '/users/:id', to: 'users#destroy'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  get '/users/:id/edit',  to: 'users#edit', as: 'edit_user'
end



# users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
