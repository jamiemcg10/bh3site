class CreateSpecialEvents < ActiveRecord::Migration
  def change
    create_table :special_events do |t|
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
