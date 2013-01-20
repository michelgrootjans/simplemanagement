class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :account_number
      t.string :account_name
      t.string :recipient_account_number
      t.string :number
      t.date :execution_date
      t.date :value_date
      t.decimal :amount
      t.string :currency
      t.string :description
      t.string :detail
      t.string :message

      t.timestamps
    end
  end
end
