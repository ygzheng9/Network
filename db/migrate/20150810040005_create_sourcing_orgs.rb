class CreateSourcingOrgs < ActiveRecord::Migration
  def change
    create_table :sourcing_orgs do |t|
      t.string :code
      t.string :desc

      t.timestamps null: false
    end
  end
end
