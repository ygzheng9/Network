class CreateRfxItems < ActiveRecord::Migration
  def change
    create_table :rfx_items do |t|
      t.integer :Rfx_id
      t.integer :plant_id
      t.integer :material_id
      t.float :quantity
      t.date :required_dt

      t.timestamps null: false
    end
  end
end
