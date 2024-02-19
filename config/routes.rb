Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:create]
      get 'transactions/:id', to: 'transactions#show'

      resources :users do
        resources :transactions, only: [:index]
      end

      get 'bitcoins/btc_price', to: 'bitcoins#btc_price'

      devise_scope :user do
        post "sign_up", to: "registrations#create"
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
