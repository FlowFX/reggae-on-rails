# frozen_string_literal: true

require 'application_system_test_case'

class VisitorTest < ApplicationSystemTestCase
  setup do
    @events = create_list(:event, 3)
  end

  test 'Maria wants to look up what is happening in the city tonight' do
    # Maria visits the home page of Reggae CDMX.
    visit '/'

    # She sees the title of the calendar
    assert_selector 'h1', text: 'Reggae CDMX'

    # and also the title of tonight's event.
    # She click's on tonight's event and gets shown the details page.
    # There she sees the event's title, date and description.
    # Happily, she returns to the main calendar to look for more events in the future.
  end
end
