# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = create(:event)
    @event_params = {
      event: {
        title: @event.title,
        date: @event.date,
        description: @event.description
      }
    }
    create(:event, :future)
    create(:event, :past)
  end

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'index has events' do
    get events_url
    assert_not_nil assigns(:events)
  end

  test 'index shows events in descending temporal order' do
    get events_url

    assert assigns(:events).first.date > assigns(:events).last.date
  end

  test 'index shows all events ever' do
    get events_url

    assert_equal assigns(:events).length, Event.all.count
  end

  test 'should get new' do
    get new_event_url
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post events_url, params: @event_params
    end

    assert_redirected_to event_url(Event.last)
  end

  test 'event requires title' do
    # GIVEN incomplete event parameters
    @event_params[:event][:title] = nil

    # WHEN creating a new event
    # THEN nothing happens
    assert_difference('Event.count', 0) do
      post events_url, params: @event_params
    end

    # WHEN updating an event
    # THEN nothing happens
    assert_difference('Event.count', 0) do
      patch event_url(@event), params: @event_params
    end
  end

  test 'event requires date' do
    @event_params[:event][:date] = nil

    assert_difference('Event.count', 0) do
      post events_url, params: @event_params
    end
  end

  ### SHOW ###
  test 'should show event' do
    get event_url(@event)
    assert_response :success
  end

  test 'should provide all correct template variables' do
    get event_url(@event)

    assert_equal assigns(:event).title,       @event.title
    assert_equal assigns(:event).date,        @event.date
    assert_equal assigns(:event).description, @event.description
  end

  ### UPDATE ###
  test 'should get edit' do
    get edit_event_url(@event)
    assert_response :success
  end

  test 'should update event' do
    patch event_url(@event), params: @event_params
    assert_redirected_to event_url(@event)
  end

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
