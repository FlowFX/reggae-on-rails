class Event < ApplicationRecord
  validates :title, :date, presence: true
  validates :title, length: {minimum: 5}
end
