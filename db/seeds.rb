
10.times do
  10.times do
    User.create(password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname: Faker::Superhero.power, email: Faker::Internet.email, image_path: Faker::Avatar.image, bio: Faker::Lorem.paragraph, kill_count: 0, game_count: 0, win_count: 0)
  end

  my_first_game = Game.create(name: Faker::Superhero.name, tagline: Faker::Superhero.name, description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, city: Faker::Address.city, state: Faker::Address.state, start_date: DateTime.now, end_date: DateTime.now, status: 'scheduled')

  User.all.each do |user|
    next_id = 1
    next_id = user.id + 1 unless user.id == User.count
    Enrollment.create(user: user, game: my_first_game, target_id: next_id, target_alive?: true, alive?: true)
  end
end

User.create(password: "password", first_name: "Tori", last_name: "Huang", nickname: "killa", email: "tori@gmail.com", image_path: "https://avatars0.githubusercontent.com/u/15917624?v=3&u=edbeef2f4e321e0e3f69e2410c87d86be7b355ac&s=140", kill_count: 0, game_count: 0, win_count: 0)
