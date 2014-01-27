class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :teacher_id
      t.string :name
      t.text :objective
      t.string :duration
      t.text :schedule
      t.string :body_group

      t.timestamps
    end
    add_index :trainings, :teacher_id
  end
end
