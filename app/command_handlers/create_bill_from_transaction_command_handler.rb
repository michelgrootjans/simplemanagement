class CreateBillFromTransactionCommandHandler
  def handle params
    transaction = Transaction.find(params[:transaction_id])
    vendor = Vendor.new
    vendor.account_number = transaction.recipient_account_number
    vendor.save
    bill = vendor.bills.create
    transaction.bill = bill
    transaction.save
  end

end