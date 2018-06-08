class CalendarController < ApplicationController
  def index
    @events = Event.order(:date)
  end
end
