class Admin::OrderItemsController < ApplicationController
  layout 'admin'
  
  def update
    @order_item=OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order_item.orders_id)
  end
  
  private
  
  def order_item_params
    params.require(:order_items).permit(:status)
  end
  
end
