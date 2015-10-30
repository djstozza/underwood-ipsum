Rails.application.routes.draw do
  get 'pages/home'

  resources :paragraphs
  root :to => 'tvcharacters#index'
  resources :quotes
  resources :tvcharacters
end
