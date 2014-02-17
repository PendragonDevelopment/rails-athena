class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.datetime :start_date
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :title
      t.datetime :end_date
      t.text :description

      t.timestamps
    end
  end
end
