class AddTieredRegoPricesToSpecialEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :special_events, :tiered_rego_prices, :text
  end
end
