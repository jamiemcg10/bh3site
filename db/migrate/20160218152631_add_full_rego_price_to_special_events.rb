class AddFullRegoPriceToSpecialEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :special_events, :full_rego_price, :float
  end
end
