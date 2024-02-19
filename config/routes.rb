Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      get 'bitcoins/btc_price', to: 'bitcoins#btc_price'

      devise_scope :user do
        post "sign_up", to: "registrations#create"
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
