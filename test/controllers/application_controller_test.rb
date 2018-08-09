# frozen_string_literal: true

require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should get 404' do
    get '/doesnt-exist/'
    assert_response :not_found
  end
end
