Rails.application.routes.draw do
#  get 'sessions/new'
  get    '/courses',  to: 'static_pages#courses'
  get    '/instructors', to: 'static_pages#instructors'
  get    '/subjects', to: 'static_pages#subjects'
  get    '/search_index', to: 'static_pages#search_index'
  get    '/search', to: 'static_pages#search'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  put    'enroll', to: 'enrollments#enroll'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root 'users#new'
end
