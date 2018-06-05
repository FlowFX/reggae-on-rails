class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :image_url
      t.string :link_url

      t.timestamps
    end
  end
end
