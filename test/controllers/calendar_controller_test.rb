# frozen_string_literal: true

require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_list(:event, 3, :future)
    create_list(:event, 2, :past)
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
    assert assigns(:events).first.date < assigns(:events).last.date
  end

  test 'only future events are shown' do
    get root_url
    assert assigns(:events).first.date >= Time.zone.today
  end

  test 'events are presented in a calendary thingy' do
    event = create(:event, date: Date.new(2018, 12, 31))
    week = event.date.cweek
    day = event.date.cwday

    get root_url
    calendar = assigns(:calendar)

    assert calendar[2018][12][week][day].is_a? Array
    assert calendar[2018][12][week][day].first.is_a? Event
  end
end
