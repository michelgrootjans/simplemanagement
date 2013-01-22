class CreateBillFromTransactionCommandHandler
  def handle params
    transaction = Transaction.find(params[:transaction_id])
    vendor = Vendor.new
    vendor.account_number = transaction.recipient_account_number
    vendor.save

    bill = vendor.bills.create(date: transaction.date, due_date: transaction.date)
    transaction.bill = bill
    transaction.save
  end

end