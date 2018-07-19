# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# Only create coverage report on CI. Keep local test runs simple and fast.
if ENV['CI']
  require 'simplecov'
  SimpleCov.start

  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

class ActiveSupport::TestCase
  fixtures :all
end
