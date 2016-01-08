class AddRegoPriceToEventRegistrations < ActiveRecord::Migration
  def change
    add_column :event_registrations, :rego_price, :float
  end
end
