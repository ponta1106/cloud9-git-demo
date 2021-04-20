require 'test_helper'

class TrashesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trashes_index_url
    assert_response :success
  end

  test "should get show" do
    get trashes_show_url
    assert_response :success
  end

  test "should get new" do
    get trashes_new_url
    assert_response :success
  end

  test "should get edit" do
    get trashes_edit_url
    assert_response :success
  end

end
