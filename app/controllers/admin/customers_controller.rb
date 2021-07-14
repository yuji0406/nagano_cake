class Admin::CustomersController < ApplicationController
  layout 'admin'
  def index
     @customers=Customer.page(params[:page]).per(10)

  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

end
