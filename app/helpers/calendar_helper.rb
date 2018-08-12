# frozen_string_literal: true

# Helper functions for the calendar controller.
module CalendarHelper
  # Create a calendar hash from a collection ov events.
  def make_calendar_from_events(events)
    calendar = {}

    events.each do |event|
      y = event.date.year
      m = event.date.month
      w = event.date.cweek
      d = event.date.cwday

      calendar[y] = {} unless calendar.key?(y)
      calendar[y][m] = {} unless calendar[y].key?(m)
      calendar[y][m][w] = {} unless calendar[y][m].key?(w)
      calendar[y][m][w][d] = { 'date': event.date, 'events': [] } unless calendar[y][m][w].key?(d)

      calendar[y][m][w][d][:events] << event
    end

    calendar
  end
end
