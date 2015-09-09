class AddTitleToRfx < ActiveRecord::Migration
  def change
    add_column :rfxes, :title, :string
    add_column :rfxes, :price_visibility, :integer
  end
end
