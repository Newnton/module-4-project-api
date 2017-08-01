Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      post '/users/signup', to: 'user#create'
      get '/me', to: 'auth#show'
      post '/listings/new', to: 'listing#create'
      get '/listings', to: 'listing#index'
      patch '/listings/edit/:id', to: 'listing#update'
      post '/listings/delete/:id', to: 'listing#delete'
      get '/listings/:id', to: 'listing#show'
      get '/saved/listings/:id', to: 'saved#user_listings'
      get '/saved/users/:id', to: 'saved#listing_users'
      post '/saved/new', to: 'saved#create'
    end
  end
end
