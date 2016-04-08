class Game < ActiveRecord::Base
  belongs_to :winner, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  has_many   :enrollments
  has_many   :players, through: :enrollments, source: :user

  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true


  def set_default_status
    if self.start_date
       self.status = "scheduled"
    else
      self.status = "pending"
    end
  end

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

  def enrolled?(user)
    !self.enrollments.includes(:user_id).where('user_id = ?', user.id).empty?
  end

  def assign_targets
    random_enrollments = self.enrollments.to_a.shuffle
    random_enrollments.each_with_index do |enrollment, index|
      next_target = index + 1 >= random_enrollments.length ? random_enrollments[0].user : random_enrollments[index + 1].user
      enrollment.update(target: next_target)
    end
  end

end

