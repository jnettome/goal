class Training < ActiveRecord::Base
  belongs_to :teacher

  validates :name, :objective, :duration, :body_group, presence: true
end
