class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  before_action :set_search


  def set_search
    @search = Item.ransack(params[:q])
    @search_items = @search.result.page(params[:page]).per(8)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:last_name,
                                                      :first_name,
                                                      :last_name_kana,
                                                      :first_name_kana,
                                                      :postal_code,
                                                      :address,
                                                      :telephone_number])
  end
end