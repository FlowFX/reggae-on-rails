# frozen_string_literal: true

class CalendarController < ApplicationController
  def index
    # The main calendar only shows today's and future events.
    events = Event.where('date >= ?', Time.zone.today).order(date: :asc)

    @calendar = {}

    events.each do |event|
      y = event.date.year

      m = event.date.month
      w = event.date.cweek
      d = event.date.cwday

      @calendar[y] = {} unless @calendar.key?(y)
      @calendar[y][m] = {} unless @calendar[y].key?(m)
      @calendar[y][m][w] = {} unless @calendar[y][m].key?(w)
      @calendar[y][m][w][d] = { 'date': event.date, 'events': [] } unless @calendar[y][m][w].key?(d)

      @calendar[y][m][w][d][:events] << event
    end
  end
end
