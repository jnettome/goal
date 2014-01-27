class Student < User
  # before_save :set_details

  # Default params for students
  # def set_details
  #   self.name = 'John Doe'
  # end

  validates :name, :city, presence: true
end
