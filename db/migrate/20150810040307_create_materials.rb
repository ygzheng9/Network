class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :code
      t.string :desc

      t.timestamps null: false
    end
  end
end
