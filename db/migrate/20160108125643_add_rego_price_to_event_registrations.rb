class AddRegoPriceToEventRegistrations < ActiveRecord::Migration[4.2]
  def change
    add_column :event_registrations, :rego_price, :float
  end
end
