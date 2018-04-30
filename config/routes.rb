Rails.application.routes.draw do

  resources :charges, only: [:new, :create]
  resources :wikis

  devise_for :users

  resources :users, only:[] do
    post '/upgrade' => 'upgrades#upgrade', as: :upgrade
    post '/downgrade' => 'upgrades#downgrade', as: :downgrade
  end

  get 'about' => 'welcome#about'

  get 'index' => 'wikis#index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
