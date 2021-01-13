require 'test_helper'

class HigriDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get getDate" do
    get higri_dates_getDate_url
    assert_response :success
  end

end
