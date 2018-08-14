# frozen_string_literal: true

require 'test_helper'

class CalendarHelperTest < ActiveSupport::TestCase
  include CalendarHelper

  def setup
    create(:event, :today)
    create(:event, :future)
    create(:event, :past)

    @events   = Event.all
    @calendar = make_calendar_from_events(@events)
  end

  test 'it returns a hash' do
    assert @calendar.is_a? Hash
  end

  test 'it provides all given events' do
    @events.each do |event|
      date = event.date

      assert @calendar[date.year][date.month][date.cweek][date.cwday][:events].include? event
    end
  end

  # TODO: add this test
  test 'the calendar is sorted ascending by date' do
  end
end
