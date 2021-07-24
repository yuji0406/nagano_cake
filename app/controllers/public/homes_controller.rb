class Public::HomesController < ApplicationController

  def top
    @genres=Genre.all
    @items=Item.all.order(:DESC)
  end

  def about
  end
end
