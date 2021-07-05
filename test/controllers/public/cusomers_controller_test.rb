require 'test_helper'

class Public::CusomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_cusomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_cusomers_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_cusomers_update_url
    assert_response :success
  end

  test "should get check" do
    get public_cusomers_check_url
    assert_response :success
  end

end
