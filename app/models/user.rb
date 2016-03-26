class User < ActiveRecord::Base
  has_many :targets, foreign_key: :target_id, class_name: 'Enrollment'
  has_many :enrollments
  has_many :wins, foreign_key: :winner_id, class_name: 'Game'
  has_many :games_created, foreign_key: :creator_id, class_name: 'Game'

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(user_credentials)
    current_user = User.find_by(email: user_credentials[:email])
    if current_user && current_user.password == user_credentials[:password]
      current_user
    else nil
    end

  end
end
