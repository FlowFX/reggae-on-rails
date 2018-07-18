require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
  end
end
