class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item=OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    if OrderItem.where(status:"製作完了",order_id:@order_item.order_id).count ==  @order_item.order.order_items.count
      @order_item.order.update(status:"発送準備中")
    elsif params[:order_item][:status] == "製作中"
      @order_item.order.update(status:"製作中")
    end
    redirect_to admin_order_path(@order_item.order_id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end

end
