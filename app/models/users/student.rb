class Student < User
  has_and_belongs_to_many :teachers,
    foreign_key: 'student_id',
    association_foreign_key: 'teacher_id',
    join_table: 'teachers_students'

  has_one :form_parq,
    foreign_key: 'user_id'

  validates :name, :city, :state, presence: true

  # before_save :set_details

  # Default params for students
  # def set_details
  #   self.name = 'John Doe'
  # end
end
