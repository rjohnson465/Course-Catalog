Rails.application.routes.draw do
  get 'static_pages/signup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root 'static_pages#signup'
end
