class Public::ItemsController < ApplicationController
before_action :set_genre,only:[:index,:show]

  def index
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
    @cart_item=CartItem.new
  end
  
  
  private
  
  def set_genre
    @genres=Genre.all
  end

end
