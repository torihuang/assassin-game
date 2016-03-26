class Game < ActiveRecord::Base
  belongs_to :winner, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  has_many :enrollments
  has_many :players, through: :enrollments, source: :user
end

