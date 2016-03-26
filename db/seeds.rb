require 'faker'
require 'date'

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname: Faker::Superhero.power, email: Faker::Internet.email, image_path: Faker::Avatar.image, bio: Faker::Lorem.paragraph, kill_count: 0, game_count: 0, win_count: 0)
end

my_first_game = Game.create(name: "Worlds First Game", tagline: "Kill or be killed", description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, city: Faker::Address.city, state: Faker::Address.state, start_date: DateTime.now, end_date: DateTime.now, status: 'scheduled')

User.all.each do |user|
  next_id = 1
  next_id = user.id + 1 unless user.id == User.count
  Enrollment.create(user: user, game: my_first_game, target_id: next_id, target_killed?: false)
end