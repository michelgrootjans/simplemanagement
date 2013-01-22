class AddAccountNumberToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :account_number, :string
  end
end
