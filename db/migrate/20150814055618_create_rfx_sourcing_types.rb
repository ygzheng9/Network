class CreateRfxSourcingTypes < ActiveRecord::Migration
  def change
    create_table :rfx_sourcing_types do |t|
      t.string :rfx_id
      t.integer :sourcing_type_id
      t.integer :is_self
      t.integer :is_invite

      t.timestamps null: false
    end
  end
end
