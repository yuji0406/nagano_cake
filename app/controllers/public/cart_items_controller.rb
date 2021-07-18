class Public::CartItemsController < ApplicationController
  layout 'public'
  def index
  end

  def update
  end

  def destroy
  end

  def empty
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to item_path(@cart_item.item_id)
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

end
