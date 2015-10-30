Rails.application.routes.draw do
  
  resources :paragraphs
  root :to => 'paragraphs#new'
  # resources :quotes
  # resources :tvcharacters
end
