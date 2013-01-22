class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.includes(:bills => [:transactions]).find(params[:id])
    @bills = @vendor.bills
    @possible_transactions = Transaction.possible_transactions_for(@vendor)
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update_attributes(params[:vendor])
    redirect_to action: :show
  end
end
