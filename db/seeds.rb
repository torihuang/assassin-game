# location and state values have been replaced with lat and long

count = 0
10.times do
  sub_count = count * 10
  10.times do
    User.create(password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname: Faker::Superhero.power, email: Faker::Internet.email, image_path: Faker::Avatar.image, bio: Faker::Lorem.paragraph, kill_count: 0, game_count: 0, win_count: 0)
  end

  new_game_1 = Game.create(status: "pending", name: Faker::Hipster.sentence(2), tagline: Faker::Hipster.sentence(5), description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, location: '528 Catalpa Road, Arcadia, CA 91007', start_date: DateTime.now, end_date: DateTime.now, creator_id: 1)

  new_game_2 = Game.create(status: ["scheduled","active","aborted","completed"].sample, name: Faker::Hipster.sentence(2), tagline: Faker::Hipster.sentence(5), description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, location: '1912 N. Lincoln Park West, Chicago, IL 60614', start_date: DateTime.now, end_date: DateTime.now, creator_id: 2)

  new_game_3 = Game.create(status: ["scheduled","active","aborted","completed"].sample, name: Faker::Hipster.sentence(2), tagline: Faker::Hipster.sentence(5), description: Faker::Lorem.paragraph, image_path: Faker::Avatar.image, location: '121 rue serviez, 64000 Pau France', start_date: DateTime.now, end_date: DateTime.now, creator_id: 3)

  10.times do
    user = User.find(sub_count + 1)
    next_id = user.id + 1 unless user.id == User.count
    Enrollment.create(user: user, game: new_game_1, target_alive?: true)
    Enrollment.create(user: user, game: new_game_2, target_id: next_id, target_alive?: true)
    Enrollment.create(user: user, game: new_game_3, target_id: next_id, target_alive?: true)
    sub_count += 1
  end
  count += 1
end

User.create(password: "password", first_name: "Tori", last_name: "Huang", nickname: "killa", email: "tori@gmail.com", image_path: "https://avatars0.githubusercontent.com/u/15917624?v=3&u=edbeef2f4e321e0e3f69e2410c87d86be7b355ac&s=140", kill_count: 0, game_count: 0, win_count: 0)

# game = Game.create!(
#   name: "test game",
#   description: "test",
#   location: "chicago",
#   state: "IL",
#   )

3.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: "Scooter"
    )
end

Enrollment.create!(user_id: 1, game_id: 1, target_id: 2)
Enrollment.create!(user_id: 2, game_id: 1, target_id: 3)
Enrollment.create!(user_id: 3, game_id: 1, target_id: 1)

User.first.update(phone: "+17082123489", phone_allowed?: "yes")
