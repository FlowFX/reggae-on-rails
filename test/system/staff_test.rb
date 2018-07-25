# frozen_string_literal: true

require 'application_system_test_case'

class VisitorTest < ApplicationSystemTestCase
  setup do
    @events = create_list(:event, 3)
  end

  test 'Jahshua wants to look up all events that ever happened anywhere' do
    # Jahshua visits the events index page.
    visit '/events/'

    # All 3 existing events are shown.
    assert page.find_all('tr', count: 3)
  end
end
