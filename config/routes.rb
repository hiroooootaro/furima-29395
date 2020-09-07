Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  devise_for :users
end
