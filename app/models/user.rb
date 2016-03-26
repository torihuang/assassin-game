class User < ActiveRecord::Base
  has_many :targets, foreign_key: :target_id, class_name: 'Enrollment'
  has_many :enrollments
  has_many :wins, foreign_key: :winner_id, class_name: 'Game'
  has_many :games_created, foreign_key: :creator_id, class_name: 'Game'
end
