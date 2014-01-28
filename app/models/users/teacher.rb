class Teacher < User
  has_many :trainings

  has_and_belongs_to_many :students,
    foreign_key: 'teacher_id',
    association_foreign_key: 'student_id',
    join_table: 'teachers_students'

  validates :name, :city, :document, :specialty, presence: true
end
