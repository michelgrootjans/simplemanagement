class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def upload
  end

  def do_upload
    Transaction.delete_all
    uploaded_io = params[:transactions]

    ImportTransactionsCommandHandler.new.handle(uploaded_io.read)

    redirect_to action: :index
  end
end
