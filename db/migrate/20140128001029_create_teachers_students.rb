class CreateTeachersStudents < ActiveRecord::Migration
  def change
    create_table :teachers_students do |t|
      t.integer :teacher_id
      t.integer :student_id
    end
    add_index :teachers_students, :teacher_id
    add_index :teachers_students, :student_id
  end
end
