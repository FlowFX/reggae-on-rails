# frozen_string_literal: true

require 'application_system_test_case'

class VisitorTest < ApplicationSystemTestCase
  setup do
    @events = create_list(:event, 3, :future)
    create_list(:event, 2, :past)
  end

  test 'Maria wants to look up what is happening in the city tonight' do
    # Maria visits the home page of Reggae CDMX.
    visit '/'

    # She sees the title of the calendar,
    assert_selector 'h1', text: 'Reggae CDMX'

    # and the informative footer,
    assert page.has_content?('Jahshua')
    assert page.has_content?('FlowFX')

    # and all future events
    assert page.find_all('tr', count: @events.count)

    # and also the title of tonight's event.
    assert page.has_content?(@events.first.title)

    # She click's on tonight's event and gets shown the details page.
    click_on(@events.first.title)

    # There she sees the event's title, date and description.
    assert page.has_content?(@events.first.title)
    assert page.has_content?(@events.first.date.strftime('%d/%m/%Y'))
    assert page.has_content?(@events.first.description)

    # Happily, she returns to the main calendar to
    # look for more events in the future.
    click_on('Calendario')
  end
end
