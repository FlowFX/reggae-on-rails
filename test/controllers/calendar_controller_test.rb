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

  test 'events are presented in a calendary thingy' do
    create(:event, date: Date.new(2018, 12, 14))
    create(:event, date: Date.new(2018, 12, 14))
    create(:event, date: Date.new(2018, 12, 15))
    event = create(:event, date: Date.new(2018, 12, 15))
    week = event.date.cweek
    day = event.date.cwday

    get root_url
    calendar = assigns(:calendar)

    assert calendar[2018][12][week][day][:date].is_a? Date
    assert calendar[2018][12][week][day][:events].is_a? Array
    assert calendar[2018][12][week][day][:events].first.is_a? Event
  end
end
