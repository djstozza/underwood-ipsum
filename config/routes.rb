Rails.application.routes.draw do


  root :to => 'paragraphs#new'
  resources :paragraphs
  # resources :quotes
  # resources :tvcharacters
end
