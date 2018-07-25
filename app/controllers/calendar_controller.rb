# frozen_string_literal: true

class CalendarController < ApplicationController
  def index
    # The main calendar only shows today's and future events.
    @events = Event.where('date >= ?', Time.zone.today).order(date: :asc)
  end
end
