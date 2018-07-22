class CalendarController < ApplicationController
  def index
    @events = Event.order(date: :asc)
  end
end
