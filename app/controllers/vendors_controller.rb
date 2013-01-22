class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
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
