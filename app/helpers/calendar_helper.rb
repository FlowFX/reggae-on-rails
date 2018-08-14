# frozen_string_literal: true

# Helper functions for the calendar controller.
module CalendarHelper
  # Create a calendar hash from a collection ov events.
  def make_calendar_from_events(events)
    # group events by year
    c = events.group_by { |event| event.date.year }

    c.each_key do |year|
      # group events by month
      c[year] =   c[year].group_by { |event| event.date.month }

      c[year].each_key do |month|
        # group events by calendar week
        c[year][month] = c[year][month].group_by { |event| event.date.cweek }

        c[year][month].each_key do |week|
          # group events by week day (1..7)
          c[year][month][week] = c[year][month][week].group_by { |event| event.date.cwday }

          c[year][month][week].each do |day, events|
            c[year][month][week][day] = {
              date: events.first.date,
              events: events
            }
          end
        end
      end
    end
  end
end
