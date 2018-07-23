Rails.application.routes.draw do
  root 'posts#home'
  devise_for :users

  # users routes
  resources :users, :only => [:show] do
    member do
      get 'followers'
      get 'following'
    end
  end

  # devise routes'


  # Post routes'
  resources :posts



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
