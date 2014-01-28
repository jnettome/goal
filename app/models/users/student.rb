class Student < User
  has_and_belongs_to_many :teachers,
    foreign_key: 'student_id',
    association_foreign_key: 'teacher_id',
    join_table: 'teachers_students'

  validates :name, :city, presence: true

  # before_save :set_details

  # Default params for students
  # def set_details
  #   self.name = 'John Doe'
  # end
end
