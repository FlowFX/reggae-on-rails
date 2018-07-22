# frozen_string_literal: true

FactoryBot.define do
  sequence :event_title do |n|
    "Event #{n}"
  end
end

FactoryBot.define do
  factory :event do
    title { generate(:event_title) }
    date Date.tomorrow
    description 'A wicked party.'
  end
end
