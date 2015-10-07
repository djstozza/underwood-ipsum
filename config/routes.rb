Rails.application.routes.draw do
  root :to => 'tvcharacters#index'
  resources :quotes
  resources :tvcharacters
end
