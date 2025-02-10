Rails.application.routes.draw do
  get "communities/index"
  get "communities/show"
  get "communities/new"
  get "communities/create"
  get "communities/edit"
  get "communities/update"
  get "communities/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    resources :communities do
      resources :posts, only: [:create]  # Nested under communities
    end
    
    resources :posts, except: [:create]  # Other post actions don't need to be nested
    resources :users, only: [:create, :update, :show]
    
    post '/login', to: 'authentication#login'
  end
end
