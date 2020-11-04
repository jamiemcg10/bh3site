class AddExtraHabTypeAndPriceToSpecialEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :special_events, :extra_hab_type, :string
    add_column :special_events, :extra_hab_price, :float
  end
end
