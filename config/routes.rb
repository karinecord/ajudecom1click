require 'sidekiq/web'

Rails.application.routes.draw do
  get 'admin', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    authenticate :admin, lambda { |u| u.full_access? } do
      mount Sidekiq::Web => '/sidekiq'
    end

    resources :send_mail, only: [:edit, :create]
    resources :admins, except: [:show]
    get 'dashboard', to: 'dashboard#index'
    resources :relatives do
      resources :disappeareds do
        resources :disappeared_photos, :only => [:create, :destroy]
        resources :disappearances
      end
    end

    get 'disappeareds', to: 'disappeareds#list'
    get 'disappearances', to: 'disappearances#list'
  end



  namespace :site do
    get 'home', to: 'home#index'
    get 'about', to: 'home#about'
    get 'manual', to: 'home#manual'

    resources :contact, only: [:new, :create]


    namespace :profile do
      resources :dashboard, only: [:index]
      resources :my_data, only:[:edit,:update]
      resources :images, :only => [:create] # support #create and #destroy
      resources :relatives do
        resources :disappeareds do
          resources :disappeared_photos, :only => [:create, :destroy]
          resources :disappearances
        end
      end
      get 'disappeareds', to: 'disappeareds#list'
      get 'disappearances', to: 'disappearances#list'
    end

  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members, controllers: {
      sessions: 'members/sessions',
      registrations: 'members/registrations'
  }

  root 'site/home#index'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
