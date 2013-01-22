class Bill < ActiveRecord::Base
  attr_accessible :date, :due_date, :notes, :vendor_id

  belongs_to :vendor
  has_many :transactions

  delegate :account_number, :search_hint, to: :vendor
end
