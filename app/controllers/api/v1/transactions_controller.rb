class Api::V1::TransactionsController < ApplicationController
  before_action :set_user, except: :show

  def index
    @transactions = @user.transactions
    if !@transactions.empty?
      render json: @transactions
    else
      render json: { error: 'Este usuario no posee transacciones' }, status: :unprocessable_entity
    end
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    if !@transaction.nil?
      render json: @transaction
    else
      render json: { error: 'No se encontró una transacción con ese ID' }, status: :unprocessable_entity
    end
  end

  def create
    currency_sent = params[:currency_sent]
    currency_received = params[:currency_received]
    wallet = @user.wallets.find_by(currency: currency_sent)
    wallet_currency_received = @user.wallets.find_by(currency: currency_received)
    amount_sent = params[:amount_sent]

    btc_price = fetch_btc_price
    amount_received = (amount_sent.to_f / btc_price).round(8)

    if wallet.amount.to_f >= amount_sent.to_f
      transaction = Transaction.create!(
        user_id: @user.id,
        currency_sent: currency_sent,
        currency_received: currency_received,
        amount_sent: amount_sent,
        amount_received: amount_received
      )

      if transaction.save
        total = (wallet.amount - amount_sent.to_i)
        wallet.update(amount: total)
        wallet_currency_received.update(amount: wallet_currency_received.amount + amount_received)
        render json: { message: 'Transacción realizada correctamente', transaction: transaction }, status: :created
      else
       render json: { error: 'No se pudo crear la transacción' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Saldo insuficiente para realizar la transacción' }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def fetch_btc_price
    response = HTTParty.get('https://api.coindesk.com/v1/bpi/currentprice.json')
    bitcoin_price = JSON.parse(response.body)['bpi']['USD']['rate_float'].round(2)
  end
end
