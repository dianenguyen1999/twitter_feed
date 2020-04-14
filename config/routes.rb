Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :tweets, only :index  #loading in all tweets 
    get 'search', to: 'tweets#search' 
    post 'tweet', to: 'tweet#tweet'
  end
end

