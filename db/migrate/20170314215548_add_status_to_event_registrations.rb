class AddStatusToEventRegistrations < ActiveRecord::Migration
  def change
    add_column :event_registrations, :status, :integer, default: 0
  end
end
