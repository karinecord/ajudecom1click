Rails.application.routes.draw do

  devise_for :admins
  devise_for :members
  root 'dashboard#index'

  resources :relatives do
    resources :disappeareds do
      resources :disappearances
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
