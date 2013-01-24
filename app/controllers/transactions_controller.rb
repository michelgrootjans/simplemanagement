class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.order(:execution_date, :number)
  end

  def unattached
    @transactions = Transaction.unattached
    render :index
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def attach
  	execute(:attatch_transaction_to_bill)
  	redirect_to request.referrer
  end

  def create_bill
  	execute(:create_bill_for_vendor)
  	redirect_to request.referrer
  end
end
