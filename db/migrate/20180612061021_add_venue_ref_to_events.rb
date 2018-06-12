class AddVenueRefToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :venue, foreign_key: true
  end
end
