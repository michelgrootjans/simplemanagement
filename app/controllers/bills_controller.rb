class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def create
    ActiveRecord::Base.transaction do
      transaction = Transaction.find(params[:transaction_id])
      vendor = Vendor.create
      bill = vendor.bills.create
      transaction.bill = bill
      transaction.save
    end

    redirect_to request.referrer
  end
end
