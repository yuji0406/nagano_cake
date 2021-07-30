class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_address,only:[:update,:edit,:destroy]
  def index
    @address=Address.new
  end

  def edit
  end

  def create
    @address=Address.new(address_params)
    if @address.save
    redirect_to addresses_path
    else
    render :index
    end
  end

  def update
    if @address.update(address_params)
    redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:address,:postal_code,:name,:customer_id)
  end
  
  def set_address
    @address=Address.find(params[:id])
  end



end
