Rails.application.routes.draw do
  root "static_pages#home"
  get '/about', to: "static_pages#about"
  get '/documentation', to: "static_pages#documentation"

  namespace :api, defaults: {format: :json} do
    resources :anime, only: [:index, :show] do 
      resources :characters, only: [:index]
    end

    resources :characters, only: [:index, :show]
  end
end
