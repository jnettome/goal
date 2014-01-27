class Teacher < User
  validates :name, :city, :document, :specialty, presence: true
end
