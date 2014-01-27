class Teacher < User
  validates :name, :city, :document, :specialty, presence: true

  has_many :trainings
end
