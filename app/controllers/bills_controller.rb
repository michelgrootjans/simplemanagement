class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @vendor = @bill.vendor
    @possible_transactions = Transaction.possible_transactions_for(@bill)
  end

  def create
    execute(:create_bill_from_transaction, params)

    redirect_to request.referrer
  end
end
