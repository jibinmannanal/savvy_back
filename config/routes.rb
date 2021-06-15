Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => 'json'} do
      namespace :v1 do
        post 'auth/signup' => 'users#create'
        post 'auth/login' => 'sessions#create'
        post 'goal' => 'goals#create'
        put 'goal/:id' => 'goals#update'
        get '/*a', to: 'goals#not_found'
      end
    end
end
