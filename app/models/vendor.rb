class Vendor < ActiveRecord::Base
  attr_accessible :name

  has_many :bills
end
