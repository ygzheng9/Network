class CreateRfxVendors < ActiveRecord::Migration
  def change
    create_table :rfx_vendors do |t|
      t.string :rfx_id
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
