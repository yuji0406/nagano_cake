class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!
  def mypage

  end

  def edit
  end

  def update
  end

  def check
  end

  def withdraw
    current_customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

end
