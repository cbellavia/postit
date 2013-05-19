Postit::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, :except => :destroy do
    resources :comments
    collection do
      get 'search'
    end
  end

end
