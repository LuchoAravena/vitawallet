# frozen_string_literal: true

FactoryBot.define do
  factory :transaction, class: 'Transaction' do
    user_id           { 1 }
    currency_sent     { 'USD' }
    currency_received { 'BTC' }
    amount_sent       { 48.0 }
    amount_received   { 0.0009258 }

    association :user, factory: :user
  end
end
