# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# TODO: use Faker lorem to add descriptions
# TODO: use Faker text to use for titles
events = Event.create(
  [
    { title: 'Last week',  date: (Time.zone.today - 7.days), description: '' },
    { title: 'Today',      date: Time.zone.today, description: '' },
    { title: 'Tomorrow',   date: (Time.zone.today + 1.day), description: '' },
    { title: 'Next week',  date: (Time.zone.today + 7.days), description: '' },
    { title: 'Next month', date: (Time.zone.today + 28.days), description: '' },
    { title: 'Next month', date: (Time.zone.today + 31.days), description: '' },
    { title: 'Next month', date: (Time.zone.today + 34.days), description: '' },
    { title: 'Next year',  date: (Time.zone.today + 360.days), description: '' }
  ]
)
