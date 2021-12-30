require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'messages#new'

  #resources :messages, except: %i[edit update]

  get '/messages', to: 'messages#index'
  get '/messages/new', to: 'messages#new', as: 'new_message'
  post '/messages', to: 'messages#create'

  get '/messages/:auth_token', to: 'messages#show', as: 'message'

  delete '/messages/:auth_token', to: 'messages#destroy'



end
