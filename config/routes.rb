Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :tags, except: [:new, :edit]
      resources :notes, except: [:new, :edit]
    end
  end
end
