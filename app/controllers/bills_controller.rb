class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def create
    execute(:create_bill_from_transaction, params)

    redirect_to request.referrer
  end
end
