class AddFullRegoPriceToSpecialEvents < ActiveRecord::Migration
  def change
    add_column :special_events, :full_rego_price, :float

  end
end
