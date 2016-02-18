class AddTieredRegoDatesToSpecialEvents < ActiveRecord::Migration
  def change
    add_column :special_events, :tiered_rego_dates, :text
  end
end
