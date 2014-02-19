class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :user
      t.references :workshop
      t.text :experience_level
      t.text :previous_experience
      t.string :rails_experience
      t.text :good_candidate
      t.text :why_rails
      t.text :questions

      t.timestamps
    end
    add_index :applications, :user_id
    add_index :applications, :workshop_id
  end
end
