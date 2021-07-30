class Public::CartItemsController < ApplicationController

before_action :authenticate_customer!
before_action :set_cart_item,only:[:update,:destroy]
before_action :set_cart_items,only:[:index,:empty]

  def index

  end

  def update
    @cart_item=CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def empty
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    if @cart_item.save!
      redirect_to cart_items_path
    else
      render 'public/items/show'
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount,:customer_id,:item_id)
  end

  def set_cart_items
    @cart_items=current_customer.cart_items
  end

  def set_cart_item
    @cart_item=CartItem.find(params[:id])
  end
end
