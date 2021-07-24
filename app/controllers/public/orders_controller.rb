class Public::OrdersController < ApplicationController
  layout 'public'


  def new
    @order=Order.new
    @addresses=current_customer.addresses
    @postage=800
  end

  def complete
  end

  def index
  end

  def show
  end

  def confirm
    @order=Order.new(order_params)
    @cart_items=current_customer.cart_items
    if params[:order][:address_option] == "0"
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.name
    elsif params[:order][:address_option] == "1"
      @address_id=params[:order][:order_address].to_i
      @address_info=Address.find(@address_id)
      @order.postal_code=@address_info.postal_code
      @order.address=@address_info.address
      @order.name=@address_info.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code=params[:order][:postal_code]
      @order.address=params[:order][:order_address]
      @order.name=params[:order][:name]
    end

  end

  def create
    @order=Order.new(order_params)

  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:name,:postage,:payment,:total_price,:address)
  end
end
