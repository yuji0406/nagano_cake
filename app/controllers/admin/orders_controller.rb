class Admin::OrdersController < ApplicationController
  layout 'admin'
  def show
    @order=Order.find(params[:id])
    @sub_total=self.price*self.amout
    
  end
  
  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
