# frozen_string_literal: true

require 'test_helper'

class CalendarControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_list(:event, 2, :past)
    create_list(:event, 3, :future)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'events are presented in a calendary thingy' do
    event = Event.last

    year = event.date.year
    month = event.date.month
    week = event.date.cweek
    day = event.date.cwday

    get root_url
    calendar = assigns(:calendar)

    assert calendar[year][month][week][day][:date].is_a? Date
    assert calendar[year][month][week][day][:events].is_a? Array
    assert calendar[year][month][week][day][:events].first.is_a? Event
  end
end
