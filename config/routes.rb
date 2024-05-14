Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/", to: "welcome#index"
  get "/cars/new", to: "cars#new"
  post "/cars", to: "cars#create"
  get "/cars", to: "cars#index"
  get "/cars/:id", to: "cars#show"
  get "/cars/:id/edit", to: "cars#edit"
  patch "/cars/:id", to: "cars#update"
  get "/car_parts", to: "car_parts#index"
  get "/cars/:car_id/car_parts/new", to: "car_carparts#new"
  post "/cars/:car_id/car_parts", to: "car_carparts#create"
  get "/car_parts/:id", to: "car_parts#show"
  get "/cars/:car_id/car_parts", to: "car_carparts#index"

  resources :cars do
    resources :car_parts, only: [:index, :new, :create]
  end


end
