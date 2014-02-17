class AddSlugToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :slug, :string
  end
end
