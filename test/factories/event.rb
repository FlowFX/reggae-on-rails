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

    trait :today do
      date { Time.zone.today }
    end

    trait :future do
      date { Time.zone.today + rand(1..90).days }
    end

    trait :past do
      date { Time.zone.today - rand(1..90).days }
    end
  end
end
