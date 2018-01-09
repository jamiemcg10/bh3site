class AddDairyAndCrashSpaceToEventRegistrations < ActiveRecord::Migration
  def change
    add_column :event_registrations, :dairy_free, :boolean, default: f
    add_column :event_registrations, :have_crash_space, :boolean, default: f
  end
end
