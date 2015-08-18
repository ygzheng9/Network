class CreateRfxes < ActiveRecord::Migration
  def change
    create_table :rfxes do |t|
      t.string :SN
      t.date :begin_dt
      t.date :end_dt
      t.integer :sourcing_org_id

      t.timestamps null: false
    end
  end
end
