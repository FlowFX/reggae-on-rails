class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :url
      t.integer :venue_id

      t.timestamps
    end
  end
end
