require "test_helper"

class LendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lends_index_url
    assert_response :success
  end

  test "should get new" do
    get lends_new_url
    assert_response :success
  end

  test "should get create" do
    get lends_create_url
    assert_response :success
  end

  test "should get edit" do
    get lends_edit_url
    assert_response :success
  end

  test "should get update" do
    get lends_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lends_destroy_url
    assert_response :success
  end
end
