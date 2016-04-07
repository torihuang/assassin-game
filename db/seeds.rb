count = 0
10.times do
  sub_count = count * 10
  10.times do
    User.create(password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname: Faker::Superhero.power, email: Faker::Internet.email, image_path: Faker::Avatar.image, bio: Faker::Lorem.paragraph, kill_count: 0, game_count: 0, win_count: 0)
  end

  new_game_1 = Game.create(status: ["scheduled","active","aborted","completed"].sample, name: Faker::Hipster.sentence(2), tagline: Faker::Hipster.sentence(5), description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, city: Faker::Address.city, state: Faker::Address.state, start_date: DateTime.now, end_date: DateTime.now)

  new_game_2 = Game.create(status: ["scheduled","active","aborted","completed"].sample, name: Faker::Hipster.sentence(2), tagline: Faker::Hipster.sentence(5), description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, city: Faker::Address.city, state: Faker::Address.state, start_date: DateTime.now, end_date: DateTime.now)

  new_game_3 = Game.create(status: ["scheduled","active","aborted","completed"].sample, name: Faker::Hipster.sentence(2), tagline: Faker::Hipster.sentence(5), description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, city: Faker::Address.city, state: Faker::Address.state, start_date: DateTime.now, end_date: DateTime.now)

  10.times do
    user = User.find(sub_count + 1)
    next_id = user.id + 1 unless user.id == User.count
    Enrollment.create(user: user, game: new_game_1, target_id: next_id, target_alive?: true)
    Enrollment.create(user: user, game: new_game_2, target_id: next_id, target_alive?: true)
    Enrollment.create(user: user, game: new_game_3, target_id: next_id, target_alive?: true)
    sub_count += 1
  end
  count += 1
end

User.create(password: "password", first_name: "Tori", last_name: "Huang", nickname: "killa", email: "tori@gmail.com", image_path: "https://avatars0.githubusercontent.com/u/15917624?v=3&u=edbeef2f4e321e0e3f69e2410c87d86be7b355ac&s=140", kill_count: 0, game_count: 0, win_count: 0)
