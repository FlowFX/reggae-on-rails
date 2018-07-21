# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title 'Birthday Bash'
    date Date.tomorrow
    description 'A wicked party.'
  end
end
