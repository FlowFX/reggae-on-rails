# frozen_string_literal: true

require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tomorrow = create(:event, title: "Tomorrow's party", date: Date.tomorrow)
    @today = create(:event, title: "Today's party", date: Time.zone.today)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'calendar index has events' do
    get root_url
    assert_not_nil assigns(:events)
  end

  test 'events are shown in ascending temporal order' do
    get root_url

    assert_equal assigns(:events)[0], @today
    assert_equal assigns(:events)[1], @tomorrow
  end
end
