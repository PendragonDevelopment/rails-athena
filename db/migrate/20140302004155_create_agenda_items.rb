class CreateAgendaItems < ActiveRecord::Migration
  def change
    create_table :agenda_items do |t|
      t.references :application
      t.datetime :start
      t.datetime :end_time
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :agenda_items, :application_id
  end
end
