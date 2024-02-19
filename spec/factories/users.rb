# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email    { 'lucho@gmail.com' }
    password { '123123asd' }
  end
end
