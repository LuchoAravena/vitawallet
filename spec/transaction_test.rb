require 'rails_helper'

RSpec.describe 'Transactions API', type: :request do
  describe 'POST /api/v1/transactions' do
    let(:user) { create(:user, email: 'lucho@gmail.com', password: '123123asd', password_confirmation: '123123asd') }
    it 'creates a new transaction' do
      wallet = create(:wallet, user: user, currency: 'USD', amount: 15500)
      wallet_currency_received = create(:wallet, user: user, currency: 'BTC')

      transaction_params = {
        user_id: user.id,
        currency_sent: 'USD',
        currency_received: 'BTC',
        amount_sent: 500
      }

      post '/api/v1/transactions', params: transaction_params

      expected_response = 'Transacción realizada correctamente'

      json = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      expect(json['message']).to eq expected_response
      expect(json['transaction']['user_id']).to eq(user.id)
      expect(json['transaction']['currency_sent']).to eq('USD')
      expect(json['transaction']['currency_received']).to eq('BTC')
      expect(json['transaction']['amount_sent']).to eq('500.0')
    end
  end

  describe 'GET /api/v1/users/:user_id/transactions' do
   let!(:user) { create(:user, id: 2) }
   let!(:transactions) { create_list(:transaction, 3, user_id: user.id) }

   it 'returns the transactions for a specific user' do
     get "/api/v1/users/#{user.id}/transactions"

     expect(response).to have_http_status(:ok)

     json = JSON.parse(response.body)
     expect(json.size).to eq(transactions.size)
     expect(json.first['user_id']).to eq(user.id)
   end
 end
end
