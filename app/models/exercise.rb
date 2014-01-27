class Exercise < ActiveRecord::Base
  belongs_to :training

  validates :name, :repetitions, presence: true
end
