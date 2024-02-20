require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'Specific Transactions', type: :request do
  describe "GET /api/v1/transactions/:id" do
    let!(:user) { create(:user, id: 1, email: 'lucho@gmail.com', password: '123123asd', password_confirmation: '123123asd') }
    let(:transaction) { create(:transaction, id: 3, user_id: 1, currency_sent: 'USD', currency_received: 'BTC', amount_sent: 48.0, amount_received: 0.0009258) }

    it "returns a specific transaction" do
      get "/api/v1/transactions/#{transaction.id}"

      json = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(json['id']).to eq(transaction.id)
    end

    it "returns an error when the ID does not exist" do
      get "/api/v1/transactions/9999"
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
