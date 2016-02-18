class AddTieredRegoPricesToSpecialEvents < ActiveRecord::Migration
  def change
    add_column :special_events, :tiered_rego_prices, :text
  end
end
