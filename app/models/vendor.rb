class Vendor < ActiveRecord::Base
  attr_accessible :name, :account_number

  has_many :bills
end
