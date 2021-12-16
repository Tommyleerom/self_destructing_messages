Rails.application.routes.draw do

  root 'messages#index'

  resources :messages, except: %i[update edit]
end
