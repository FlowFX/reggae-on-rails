class Event < ApplicationRecord
  belongs_to :venue, required: false

  validates :title, :date, presence: true
  validates :title, length: {minimum: 5}
end
