Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_scope :user do
        post 'users/sign_in', to: 'sessions#create'
      end

      resources :tags, except: [:new, :edit]
      resources :notes, except: [:new, :edit]
    end
  end
end
