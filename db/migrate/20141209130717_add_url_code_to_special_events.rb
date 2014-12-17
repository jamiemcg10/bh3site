class AddUrlCodeToSpecialEvents < ActiveRecord::Migration
  def change
    add_column :special_events, :url_code, :string
  end
end
