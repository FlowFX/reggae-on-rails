# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = create(:user)

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

  ### ANONYMOUS USER ###
  test '#index redirects to sign in page' do
    get events_url
    assert_redirected_to new_user_session_path
  end

  test '#new redirects to sign in page' do
    get new_event_url
    assert_redirected_to new_user_session_path
  end

  test '#create should be forbidden' do
    post events_url, params: @event_params
    assert_redirected_to new_user_session_path
  end

  test '#edit redirects to sign in page' do
    get edit_event_url(@event)
    assert_redirected_to new_user_session_path
  end

  test '#update is forbidden' do
    patch event_url(@event), params: @event_params
    assert_redirected_to new_user_session_path
  end

  test '#show should show event' do
    get event_url(@event)
    assert_response :success
  end

  test '#show should provide all correct template variables' do
    get event_url(@event)

    assert_equal assigns(:event).title,       @event.title
    assert_equal assigns(:event).date,        @event.date
    assert_equal assigns(:event).description, @event.description
  end

  ### AUTHENTICATED USER ###
  test 'can get index' do
    sign_in @user

    get events_url
    assert_response :success
  end

  test 'index has events' do
    sign_in @user

    get events_url
    assert_not_nil assigns(:events)
  end

  test 'index shows events in descending temporal order' do
    sign_in @user
    get events_url

    assert assigns(:events).first.date > assigns(:events).last.date
  end

  test 'index shows all events ever' do
    sign_in @user
    get events_url

    assert_equal assigns(:events).length, Event.all.count
  end

  test 'should get new' do
    sign_in @user
    get new_event_url

    assert_response :success
  end

  test 'should create event' do
    sign_in @user
    assert_difference('Event.count') do
      post events_url, params: @event_params
    end

    assert_redirected_to event_url(Event.last)
    assert flash[:notice].present?
  end

  ### UPDATE ###
  test 'should get edit' do
    sign_in @user
    get edit_event_url(@event)
    assert_response :success
  end

  test 'should update event' do
    sign_in @user
    patch event_url(@event), params: @event_params
    assert_redirected_to event_url(@event)
  end

  test 'should destroy event' do
    sign_in @user
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
