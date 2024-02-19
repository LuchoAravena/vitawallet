class Transaction < ApplicationRecord
  belongs_to :user

  validates :amount_sent, presence: true
end
