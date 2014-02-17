class CreateWorkshopUsers < ActiveRecord::Migration
  def change
    create_table :workshop_users do |t|
      t.references :user
      t.references :workshop
      t.string 		 :workshop_role

      t.timestamps
    end
    add_index :workshop_users, :user_id
    add_index :workshop_users, :workshop_id
  end
end
