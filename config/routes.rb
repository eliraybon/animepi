Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :anime, only: [:index, :show] do 
      resources :characters, only: [:index]
    end

    resources :characters, only: [:index, :show]
  end
end
