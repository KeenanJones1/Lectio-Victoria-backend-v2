require 'test_helper'

class ReadingListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reading_list_index_url
    assert_response :success
  end

  test "should get create" do
    get reading_list_create_url
    assert_response :success
  end

  test "should get new" do
    get reading_list_new_url
    assert_response :success
  end

  test "should get show" do
    get reading_list_show_url
    assert_response :success
  end

  test "should get edit" do
    get reading_list_edit_url
    assert_response :success
  end

  test "should get update" do
    get reading_list_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reading_list_destroy_url
    assert_response :success
  end

end
