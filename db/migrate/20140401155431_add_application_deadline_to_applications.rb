class AddApplicationDeadlineToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :deadline, :datetime
  end
end
