class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @vendor = @bill.vendor
    @possible_transactions = Transaction.where(bill_id: nil)
                                        .find_all_by_recipient_account_number(@vendor.account_number)
    @possible_transactions -= @bill.transactions
  end

  def create
    execute(:create_bill_from_transaction, params)

    redirect_to request.referrer
  end
end
