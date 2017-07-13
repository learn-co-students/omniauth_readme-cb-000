Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
