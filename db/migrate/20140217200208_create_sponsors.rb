class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :website
      t.string :phone
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zipcode
      t.attachment :logo
      t.text :description

      t.timestamps
    end
  end
end
