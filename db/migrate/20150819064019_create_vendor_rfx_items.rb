class CreateVendorRfxItems < ActiveRecord::Migration
  def change
    create_table :vendor_rfx_items do |t|
      t.integer :vendor_id
      t.integer :rfx_item_id
      t.float :unit_price

      t.timestamps null: false
    end
  end
end
