require 'test_helper'

class PickUpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pick_ups_index_url
    assert_response :success
  end

  test "should get show" do
    get pick_ups_show_url
    assert_response :success
  end

  test "should get new" do
    get pick_ups_new_url
    assert_response :success
  end

  test "should get edit" do
    get pick_ups_edit_url
    assert_response :success
  end

end
