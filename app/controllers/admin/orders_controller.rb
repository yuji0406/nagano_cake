class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order=Order.find(params[:id])
    @order_items=OrderItem.where(order_id:@order.id)
  end

  def update
    order=Order.find(params[:id])
    if params[:order][:status] == "入金確認"
      order.update(order_params)
      order.order_items.each do |order_item|
        order_item.update(status: "製作待ち")
      end
    else
        order.update(order_params)
    end
    redirect_to admin_order_path(order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
