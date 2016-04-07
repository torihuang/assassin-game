class Game < ActiveRecord::Base
  belongs_to :winner, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  has_many :enrollments
  has_many :players, through: :enrollments, source: :user

  def self.scheduled_games
    Game.where(status: 'scheduled')
  end

  #returns integer of non-killed people
  def active_player_count
    self.enrollments.where(killed_by_id: nil).count
  end

  # returns array of user/player objects in the game who aren't dead
  def active_players
    active_enrollments = self.players.enrollments.where(killed_by_id: nil)
    active_enrollments.select{ |enrollment| enrollment.player }
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

