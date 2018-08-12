# frozen_string_literal: true

class CalendarController < ApplicationController
  include CalendarHelper

  def index
    # The main calendar only shows today's and future events.
    events = Event.where('date >= ?', Time.zone.today).order(date: :asc)

    @calendar = make_calendar_from_events(events)
  end
end
