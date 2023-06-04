Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers do
        resources :subscriptions, only: [:index, :update, :destroy], controller: 'customers/subscriptions'
      end
    end
  end
end
