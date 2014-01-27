class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :training_id
      t.string :name
      t.string :repetitions
      t.string :series
      t.string :interval
      t.string :weight

      t.timestamps
    end
    add_index :exercises, :training_id
  end
end
