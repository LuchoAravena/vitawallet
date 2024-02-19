require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it 'validates the presence of amount_sent' do
      transaction = Transaction.new(amount_sent: nil)
      expect(transaction).not_to be_valid
      expect(transaction.errors[:amount_sent]).to include("can't be blank")
    end
  end
end
