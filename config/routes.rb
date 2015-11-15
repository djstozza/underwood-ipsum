Rails.application.routes.draw do

  resources :paragraphs
  get 'paragraphs/home' => 'paragraphs#home'

  root :to => 'paragraphs#new'
  resources :quotes
  resources :tvcharacters
end
