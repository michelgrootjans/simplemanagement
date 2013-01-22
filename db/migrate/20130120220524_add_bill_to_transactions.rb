class AddBillToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :bill_id, :integer
  end
end
