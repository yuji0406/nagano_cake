class Admin::ItemsController < ApplicationController
  layout 'admin'
  def index
    @items=Item.page(params[:page]).per(10)
  end

  def new
    @items=Item.new

  end

  def show
    @item=Item.find_by(id:params[:id])
    @tax=1.1
    @tax_price=@tax*@item.price


  end

  def edit
    @item=Item.find_by(id:params[:id])

  end

  def create
    @items=Item.new(item_params)
    if @items.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def update
    @item=Item.find_by(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end
