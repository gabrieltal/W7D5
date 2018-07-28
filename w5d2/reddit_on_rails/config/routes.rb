Rails.application.routes.draw do
  resources :users
  resources :subs
  resources :posts do
    resources :comments, only: [:new]
  end
  resource :session
  resources :comments, only: [:edit, :destroy, :create, :update, :show]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
