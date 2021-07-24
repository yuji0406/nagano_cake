class Admin::HomesController < ApplicationController
  layout 'admin'
  def top
    @orders=Order.page(params[:page]).per(10)
    
  end
end
