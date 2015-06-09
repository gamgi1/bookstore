Rails.application.routes.draw do

 namespace :admin do
    get '/' => 'base#index'
    resources :books
    get '/add' => 'administrators#new'
    post '/add' => 'administrators#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

  end
end
