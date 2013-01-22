class Vendor < ActiveRecord::Base
  attr_accessible :name, :search_hint

  has_many :bills

  def amount
    bills.map(&:amount).sum
  end
end
