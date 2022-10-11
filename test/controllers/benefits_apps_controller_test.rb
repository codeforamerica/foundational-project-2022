require "test_helper"

class BenefitsAppsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get benefits_apps_index_url
    assert_response :success
  end

  test "should get new" do
    get benefits_apps_new_url
    assert_response :success
  end

  test "should get create" do
    get benefits_apps_create_url
    assert_response :success
  end
end
