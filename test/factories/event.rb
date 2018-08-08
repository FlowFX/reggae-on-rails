# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :event do
    title       Faker::Lorem.sentence
    date        Date.tomorrow
    description Faker::Lorem.paragraphs

    trait :today do
      date { Time.zone.today }
    end

    trait :future do
      date { Faker::Date.forward(90) }
    end

    trait :past do
      date { Faker::Date.backward(90) }
    end
  end
end
