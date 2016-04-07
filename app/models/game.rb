class Game < ActiveRecord::Base
  belongs_to :winner, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  has_many :enrollments
  has_many :players, through: :enrollments, source: :user


  def self.scheduled_games
    Game.where(status: 'scheduled')
  end

  def self.active_games
    Game.where(status: 'active')
  end

  def self.completed_games
    Game.where(status: 'completed')
  end

  def self.aborted_games
    Game.where(status: 'aborted')
  end

end

