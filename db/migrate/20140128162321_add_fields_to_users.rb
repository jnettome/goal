class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :short_bio, :text
  end
end
