class Admin::ItemsController < ApplicationController
  layout 'admin'
  def index
    @items=Item.page(params[:page]).per(10)
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

end
