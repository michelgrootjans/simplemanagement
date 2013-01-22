class UploadController < ApplicationController
  def transactions
    uploaded_io = params[:transactions]

    ImportTransactionsCommandHandler.new.handle(uploaded_io.read)

    redirect_to request.referrer
  end
end
