class AddFullRegoPriceToSpecialEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :special_events, :full_rego_price, :float
  end
end
