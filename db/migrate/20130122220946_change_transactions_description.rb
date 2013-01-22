class ChangeTransactionsDescription < ActiveRecord::Migration
  def up
    change_column :transactions, :description, :text
  end

  def down
    change_column :transactions, :description, :string
  end
end
