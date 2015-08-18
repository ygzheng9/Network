class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :code
      t.string :desc

      t.timestamps null: false
    end
  end
end
