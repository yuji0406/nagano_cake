class Public::ItemsController < ApplicationController


  def index
    @genres=Genre.all
    if params[:genre_id]
      @genre=Genre.find(params[:genre_id])
      @items=@genre.items.page(params[:page]).per(8)
    else
      @items=Item.page(params[:page]).per(8)
    end

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
