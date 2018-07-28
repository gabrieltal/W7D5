Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :bands
  resources :albums, only: [:new, :create, :edit, :show, :update, :destroy]
  resources :tracks, only: [:new, :create, :edit, :show, :update, :destroy]

end
