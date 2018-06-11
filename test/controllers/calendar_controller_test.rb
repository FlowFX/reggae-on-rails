require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calendar_index_url
    assert_response :success
    assert_select 'h1', 'Eventos'
    assert_select 'td', 'Jahshua Soundman Birthday Bash'
  end

end
