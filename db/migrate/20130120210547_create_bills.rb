class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :vendor_id
      t.date :date
      t.date :due_date
      t.text :notes

      t.timestamps
    end
  end
end
