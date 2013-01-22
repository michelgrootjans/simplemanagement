class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def attach_transaction
  	execute(:attatch_transaction_to_bill)
  	redirect_to request.referrer
  end
end
