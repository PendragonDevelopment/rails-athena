class ChangeApplicationIdToWorkshopId < ActiveRecord::Migration
  def up
    add_column :agenda_items, :workshop_id, :integer
    add_index :agenda_items, :workshop_id
    remove_index :agenda_items, :application_id
    remove_column :agenda_items, :application_id
  end

  def down
    remove_index :agenda_items, :workshop_id
    remove_column :agenda_items, :workshop_id
    add_column :agenda_items, :application_id, :integer
    add_index :agenda_items, :application_id
  end
end
