require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'event requires title and date' do
    event = Event.new
    assert event.invalid?
    assert event.errors[:title].any?
    assert event.errors[:date].any?
  end

  test 'event title require at least 5 characters' do
    event = events(:one)
    assert event.valid?

    event.title = '1234'
    assert event.invalid?
  end
end
