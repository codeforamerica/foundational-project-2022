require "test_helper"

class BenefitsAppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get benefits_app_index_url
    assert_response :success
  end
end
