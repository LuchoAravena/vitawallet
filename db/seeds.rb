# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: 'lucho@gmail.com', password: 'password1', password_confirmation: 'password1')
User.create(email: 'usuario2@example.com', password: 'password2', password_confirmation: 'password2')

Wallet.create(user_id: 1, currency: 'USD', amount: 52000)
Wallet.create(user_id: 1, currency: 'BTC', amount: 0.00000253)

Transaction.create(user_id: 1, currency_sent: 'USD', currency_received: 'BTC', amount_sent: 48.00, amount_received: 0.0004258)
