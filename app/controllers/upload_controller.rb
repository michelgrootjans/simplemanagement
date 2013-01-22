class UploadController < ApplicationController
  def transactions
  	execute :import_transactions

    redirect_to request.referrer
  end
end
