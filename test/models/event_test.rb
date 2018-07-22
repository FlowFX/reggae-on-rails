# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = create(:event)
  end

  test 'valid event' do
    assert @event.valid?
  end

  test 'invalid without title' do
    @event.title = nil
    assert_not @event.valid?
    assert_not_nil @event.errors[:title]
  end

  test 'invalid without date' do
    @event.date = nil
    assert_not @event.valid?
    assert_not_nil @event.errors[:date]
  end
end
