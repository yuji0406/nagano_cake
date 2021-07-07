class Admin::SessionsController < ApplicationController
  def new
    @customer=Customer.new
  end
  
  def create
    @customer=Customer.new(customer_params)
    @customer.save
  end
  
  def destroy
  end
  
  private
  def customer_params
    params.require(:customer).permit(:email,:password)
  end
end
