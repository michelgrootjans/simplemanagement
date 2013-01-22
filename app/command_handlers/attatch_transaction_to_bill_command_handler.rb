class AttatchTransactionToBillCommandHandler
	def handle params
		bill = Bill.find params[:bill_id]
		transaction = Transaction.find params[:id]

		transaction.bill = bill
		transaction.save
	end
end