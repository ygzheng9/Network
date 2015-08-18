class CreateRfxRounds < ActiveRecord::Migration
  def change
    create_table :rfx_rounds do |t|
      t.integer :rfx_id
      t.string :start_dt
      t.date :end_dt

      t.timestamps null: false
    end
  end
end
