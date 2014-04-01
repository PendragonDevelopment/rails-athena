class AddDeadlineToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :deadline, :datetime
  end
end
