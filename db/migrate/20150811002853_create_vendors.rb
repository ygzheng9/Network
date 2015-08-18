class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :code
      t.string :name
      t.string :string
      t.string :desc

      t.timestamps null: false
    end
  end
end
