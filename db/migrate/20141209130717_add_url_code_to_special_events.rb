class AddUrlCodeToSpecialEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :special_events, :url_code, :string
  end
end
