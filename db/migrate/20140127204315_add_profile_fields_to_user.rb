class AddProfileFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :document, :string
    add_column :users, :specialty, :string
  end
end
