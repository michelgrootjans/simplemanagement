class Transaction < ActiveRecord::Base
  attr_accessible :account_name, :account_number, :amount, :currency, :description, :execution_date, :message, :number, :recipient_account_number, :value_date

  belongs_to :bill

  def date
    execution_date
  end

  def summary
    [message, detail, description].compact.join("-")
  end
end
