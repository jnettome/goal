class Training < ActiveRecord::Base
  belongs_to :teacher

  has_many :exercises

  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: true

  validates :name, :objective, :duration, :body_group, presence: true
end
