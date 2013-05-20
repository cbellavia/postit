Postit::Application.routes.draw do
  root to: 'posts#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :posts, :except => :destroy do
    resources :comments
    collection do
      get 'search'
    end
  end
  
  resources :users, :only => [:new, :create]

end
