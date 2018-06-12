require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  test 'Venue requires a name' do
    venue = Venue.new
    assert venue.invalid?
    assert venue.errors[:name].any?
  end
end
