class AddRfxIdToVendorRfxItem < ActiveRecord::Migration
  def change
    add_column :vendor_rfx_items, :rfx_id, :int
  end
end
