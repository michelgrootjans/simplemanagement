class Transaction < ActiveRecord::Base
  attr_accessible :account_name, :account_number, :amount, :currency, :description, :execution_date, :message, :number, :recipient_account_number, :value_date

  scope :unattached, Transaction.where(bill_id: nil).order(:number)

  belongs_to :bill
  delegate :vendor, :vendor_name, to: :bill

  def date
    execution_date
  end

  def summary
    [message, detail, description].compact.join("-")
  end

  def amount
    read_attribute(:amount) || 0
  end

  def self.possible_transactions_for entity
    transactions = Transaction.where(bill_id: nil)
    if entity.account_number.present?
      return transactions.where(recipient_account_number: entity.account_number)
    elsif entity.search_hint.present?
      return transactions.where("description LIKE :hint OR detail LIKE :hint OR message LIKE :hint", hint: "%#{entity.search_hint}%")
    else
      return []
    end
  end
end
