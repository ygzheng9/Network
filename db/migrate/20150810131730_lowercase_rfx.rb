class LowercaseRfx < ActiveRecord::Migration
  def change
     rename_column :rfx_items, :Rfx_id, :rfx_id
  end
end
