# frozen_string_literal: true

FactoryBot.define do
  factory :wallet, class: 'Wallet' do
    user_id   { 1 }
    currency  { 'USD' }
    amount    { 15500 }
  end
end
