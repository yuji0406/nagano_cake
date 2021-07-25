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
      @order.order_address=current_customer.address
      @order.name=current_customer.full_name
    elsif params[:order][:address_option] == "1"
      @address_id=params[:order][:order_add]
      @address_info=Address.find(id=@address_id)
      @order.postal_code=@address_info.postal_code
      @order.order_address=@address_info.address
      @order.name=@address_info.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code=params[:order][:postal_code]
      @order.order_address=params[:order][:order_address]
      @order.name=params[:order][:name]
    end

  end

  def create
    @order=Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_item=OrderItem.new
      @order_item.amount=cart_item.amount
      @order_item.price=cart_item.item.price
      @order_item.order_id=@order.id
      @order_item.item_id=cart_item.item_id
      @order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(
                                  :customer_id,
                                  :postal_code,
                                  :name,
                                  :postage,
                                  :payment,
                                  :total_price,
                                  :order_address,
                                  :address_option)
  end
end
