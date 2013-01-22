class Transaction < ActiveRecord::Base
  attr_accessible :account_name, :account_number, :amount, :currency, :description, :execution_date, :message, :number, :recipient_account_number, :value_date

  belongs_to :bill
end
