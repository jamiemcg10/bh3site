class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.string  :hash_name
      t.string  :email
      t.string  :kennel
      t.string  :food_preference
      t.boolean :gluten_allergy
      t.boolean :need_crash_space
      t.boolean :shirt
      t.string  :shirt_size
      t.date    :registration_date
      t.string  :event

      t.timestamps
    end
  end
end
