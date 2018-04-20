Rails.application.routes.draw do
  resources :wikis

  devise_for :users
  
  get 'about' => 'welcome#about'

  get 'index' => 'wikis#index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
