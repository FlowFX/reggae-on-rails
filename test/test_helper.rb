# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'awesome_print'

require 'minitest/reporters'
Minitest::Reporters.use!

require 'simplecov'
SimpleCov.start

if ENV['CI']
  # Only send coverage report to CodeCov when on CI
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
