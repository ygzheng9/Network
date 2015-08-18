class CreateSourcingTypes < ActiveRecord::Migration
  def change
    create_table :sourcing_types do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
