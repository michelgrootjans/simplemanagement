class AddSearchHintToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :search_hint, :string
  end
end
