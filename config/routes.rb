Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :coins, only: [:index]

  get '/test_data', to: 'test#get'
end
