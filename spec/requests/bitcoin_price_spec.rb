require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'Bitcoin API', type: :request do
  describe 'GET /api/v1/bitcoins/btc_price' do
    it 'returns the bitcoin price with currency' do
      stub_request(:get, 'https://api.coindesk.com/v1/bpi/currentprice.json')
        .to_return(body: {
          bpi: {
            USD: { rate_float: 52000.0 }
          }
        }.to_json)

      get '/api/v1/bitcoins/btc_price'

      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      expect(json_response['bitcoin_price']).to eq('$ 52000.0')
    end
  end
end
