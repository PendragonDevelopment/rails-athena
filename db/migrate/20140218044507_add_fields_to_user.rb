class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :twitter, :string
    add_column :users, :github, :string
    add_column :users, :os, :string
    add_column :users, :shirt_size, :string
  end
end
