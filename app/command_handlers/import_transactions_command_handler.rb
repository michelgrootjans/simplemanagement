require 'csv'

class ImportTransactionsCommandHandler < CommandHandler
  def handle params
    uploaded_io = params[:transactions]
    import(uploaded_io.read)
    @messages.each do |m|
      Rails.logger.debug m
    end
  end

  def import csv
    transactions = convert(csv)

    Transaction.delete_all
    Bill.delete_all
    Vendor.delete_all

    for transaction in transactions do
      transaction.save
    end
  end

  def convert csv_content
    hash = csv_to_hash(csv_content)
    hash.map{|row| convert_transaction(row)}
  end

  def csv_to_hash(csv_content)
    csv = CSV.parse(csv_content.force_encoding('ISO-8859-1'), headers: true, col_sep: ";")
    csv.collect { |record| record.to_hash }
  end

  def convert_transaction(row)
    if row["Omzetnummer"] == "12"
      @messages = []
      @messages << "************"
      @messages << row.inspect
      @messages << "************"
      @messages << row["Omschrijving"]
      @messages << "************"
      @messages << row["Detail van de omzet"]
      @messages << "************"
      @messages << row["Bericht"]
      @messages << "************"
    end
    transaction = Transaction.new
    transaction.account_number = row["Rekeningnummer"]
    transaction.account_name = row["Naam van de rekening"]
    transaction.recipient_account_number = row["Rekening tegenpartij"]
    transaction.number = row["Omzetnummer"]
    transaction.execution_date = row["Boekingsdatum"]
    transaction.value_date = row["Valutadatum"]
    transaction.amount = (row["Bedrag"] || "").gsub(",", ".")
    transaction.currency = row["Munteenheid"]
    transaction.description = row["Omschrijving"]
    transaction.detail = row["Detail van de omzet"]
    transaction.message = row["Bericht"]
    transaction
  end
end