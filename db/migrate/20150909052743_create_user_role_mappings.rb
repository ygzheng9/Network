class CreateUserRoleMappings < ActiveRecord::Migration
  def change
    create_table :user_role_mappings do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps null: false
    end
  end
end
