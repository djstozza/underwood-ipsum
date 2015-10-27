Rails.application.routes.draw do
  resources :paragraphs
  root :to => 'tvcharacters#index'
  resources :quotes
  resources :tvcharacters
end
