Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tech#index'
  get '/new', to: 'project#new'
  get ':tech', to: 'category#index'
  get ':tech/:category', to: 'project#index'
  post '/create_project', to: 'project#create_project'
end
