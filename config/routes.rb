Rails.application.routes.draw do

  resources :charges, only: [:new, :create]
  resources :wikis do
    resources :collaborators, only: [:new, :create] do
      # making a route so we don't have to pass an id through url
      collection do
        delete :destroy
      end
    end
  end


  devise_for :users

  resources :users, only:[] do
    post :downgrade
  end

  get 'about' => 'welcome#about'

  get 'index' => 'wikis#index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
