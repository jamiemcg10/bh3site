class CreateSiteSections < ActiveRecord::Migration
  def change
    create_table :site_sections do |t|
      t.string :tag
      t.string :data_type
      t.text :value

      t.timestamps
    end
  end
end
