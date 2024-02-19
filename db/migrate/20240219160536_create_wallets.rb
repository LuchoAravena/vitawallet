class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :currency
      t.decimal :amount

      t.timestamps
    end
  end
end
