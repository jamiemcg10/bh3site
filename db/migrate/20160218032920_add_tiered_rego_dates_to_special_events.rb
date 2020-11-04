class AddTieredRegoDatesToSpecialEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :special_events, :tiered_rego_dates, :text
  end
end
