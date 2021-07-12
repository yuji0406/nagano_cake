class Admin::ItemsController < ApplicationController
  layout 'admin'
  def index
    @items=Item.page(params[:page]).per(10)
  end

  def new
    @items=Item.new
    
  end

  def show
  end

  def edit
  end

  def create
    @items=Item.new(item_params)
    if @items.save
      redirect to admin_items_path
    else
      render :new
    end
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end
