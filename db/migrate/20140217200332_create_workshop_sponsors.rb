class CreateWorkshopSponsors < ActiveRecord::Migration
  def change
    create_table :workshop_sponsors do |t|
      t.references :sponsor
      t.references :workshop

      t.timestamps
    end
    add_index :workshop_sponsors, :sponsor_id
    add_index :workshop_sponsors, :workshop_id
  end
end
