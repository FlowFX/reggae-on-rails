# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    email    Faker::Internet.email
    password 'super-secret-password'
  end
end
