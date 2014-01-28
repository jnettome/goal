class CreateFormParqs < ActiveRecord::Migration
  def change
    create_table :form_parqs do |t|
      t.integer :user_id
      t.boolean :answer1
      t.boolean :answer2
      t.boolean :answer3
      t.boolean :answer4
      t.boolean :answer5
      t.boolean :answer6
      t.boolean :answer7

      t.timestamps
    end
    add_index :form_parqs, :user_id
  end
end
