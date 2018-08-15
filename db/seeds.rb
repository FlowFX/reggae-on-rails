# frozen_string_literal: true

require 'faker'

Event.create(
  [
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.backward(7) },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.forward(1) },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.forward(7) },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.between(7.days.from_now, 21.days.from_now) },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.between(14.days.from_now, 31.days.from_now) },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.between(21.days.from_now, 42.days.from_now) },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.between(31.days.from_now, 90.days.from_now) },
    { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs, date: Faker::Date.between(370.days.from_now, 420.days.from_now) }
  ]
)
