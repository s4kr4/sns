Rails.application.routes.draw do

  root 'static_pages#home'

  get 'users/index'

  resources :user
end
