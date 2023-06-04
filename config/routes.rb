Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :api do
    resources :v1 do
      resources :customers do
        resources :subcriptions, only: [:index, :update, :destroy]
      end
    end
  end
end
