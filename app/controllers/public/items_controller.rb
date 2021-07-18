class Public::ItemsController < ApplicationController
  layout 'public'
  def index
    @genres=Genre.all
    @items=Item.page(params[:page]).per(8)
  end
  
  def search
  end

  def show
  end
end
