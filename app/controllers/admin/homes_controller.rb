class Admin::HomesController < ApplicationController
  def top
    @orders=Order.page(params[:page]).per(5)
    
  end
end
