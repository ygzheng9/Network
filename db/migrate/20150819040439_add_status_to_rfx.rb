class AddStatusToRfx < ActiveRecord::Migration
  def change
    add_column :rfxes, :status, :int
  end
end
