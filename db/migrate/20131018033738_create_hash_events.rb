class CreateHashEvents < ActiveRecord::Migration
  def change
    create_table :hash_events do |t|
      t.string :google_id
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
