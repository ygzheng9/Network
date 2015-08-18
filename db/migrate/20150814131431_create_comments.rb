class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_type
      t.integer :ref_id
      t.string :author
      t.string :comment

      t.timestamps null: false
    end
  end
end
