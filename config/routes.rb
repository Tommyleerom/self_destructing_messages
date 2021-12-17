Rails.application.routes.draw do

  root 'messages#new'

  resources :messages, except: %i[update edit]
end
