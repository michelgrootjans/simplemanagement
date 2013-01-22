class UploadController < ApplicationController
  def transactions
  	execute :import_transaction

    redirect_to request.referrer
  end
end
