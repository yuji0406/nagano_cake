class Public::ItemsController < ApplicationController
  layout 'public'
  def index
    @genres=Genre.all
    @items=Item.page(params[:page]).per(8)
  end

  def search
  end

  def show
    @item=Item.find(params[:id])
    @tax=1.1
    @genres=Genre.all
    @cart_item=CartItem.new
  end
  
end
