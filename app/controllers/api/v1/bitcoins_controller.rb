class Api::V1::BitcoinsController < ApplicationController
  require 'httparty'

  def btc_price
    response = HTTParty.get('https://api.coindesk.com/v1/bpi/currentprice.json')
    bitcoin_price = JSON.parse(response.body)['bpi']['USD']['rate_float'].round(2)
    bitcoin_price_with_currency = "$#{bitcoin_price}"
    render json: { bitcoin_price: bitcoin_price_with_currency }
  end
end
