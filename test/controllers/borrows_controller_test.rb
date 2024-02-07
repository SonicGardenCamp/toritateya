require "test_helper"

class BorrowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get borrows_index_url
    assert_response :success
  end

  test "should get new" do
    get borrows_new_url
    assert_response :success
  end

  test "should get create" do
    get borrows_create_url
    assert_response :success
  end

  test "should get edit" do
    get borrows_edit_url
    assert_response :success
  end

  test "should get update" do
    get borrows_update_url
    assert_response :success
  end

  test "should get destroy" do
    get borrows_destroy_url
    assert_response :success
  end
end
