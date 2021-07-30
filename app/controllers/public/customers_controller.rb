class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!
  def mypage

  end

  def edit
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customers_mypage_path
    else
      render :edit
    end
  end

  def check
  end

  def withdraw
    current_customer.update(is_active:false)
    reset_session
    redirect_to root_path
  end
  private

  def customer_params
    params.require(:customer).permit( :first_name,
                                      :last_name,
                                      :first_name_kana,
                                      :last_name_kana,
                                      :address,
                                      :postal_code,
                                      :telephone_number,
                                      :email)
  end
end
