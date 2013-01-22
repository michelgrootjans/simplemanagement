class CreateBillForVendorCommandHandler
  def handle params
    vendor = Vendor.find params[:vendor_id]
    transaction = Transaction.find params[:id]

    bill = vendor.bills.create
    transaction.bill = bill
    transaction.save
  end
end