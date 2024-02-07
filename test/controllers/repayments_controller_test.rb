require "test_helper"

class RepaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get repayments_new_url
    assert_response :success
  end
end
