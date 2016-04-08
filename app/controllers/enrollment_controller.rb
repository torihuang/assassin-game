post '/enrollment' do
  enrollment = Enrollment.new(user: current_user, game_id: params[:game_id])

  if enrollment.save
    redirect "/games/#{params[:game_id]}"
  else
    @errors = enrollment.errors.full_messages
  end
end

#EB NOTE
# Currently, it still lists that player's next target from their most recent enrollment on their show page. That's a thing to configure. I tested this code by seeding the DB with 3 users and killing them one after the other, it seems to work. -EB

#changes the player's/killer's enrollment record
put '/enrollments/:id' do
  @enrollment = Enrollment.find(params[:id])
  killer = @enrollment.user
  game = @enrollment.game
  # puts killer.first_name
  # puts "is the killer"
  new_corpse = @enrollment.target
  # puts new_corpse.first_name
  # puts "is now dead"
  new_corpse_record = new_corpse.enrollments.find_by(game_id: game.id)
  new_corpse_record.killed_by_id = killer.id
  new_corpse_record.save
  # binding.pry

  message = ""

  if @enrollment.game.active_player_count > 1
    # continue game
    killer_record = killer.enrollments.find_by(game_id: game.id)
    killer_record.target = new_corpse_record.target
    killer_record.save

    message = "#{@enrollment.target.nickname} was assassinated by #{killer.nickname}! Watch out, you never know who might be next..."
    send_texts(game, message)
    redirect "/users/#{killer.id}"
  else
    # end game
    @game = @enrollment.game
    @game.assign_attributes(status: "completed", winner_id: killer.id, end_date: DateTime.now.to_s)
    puts "Congratulations, #{killer}!"
    @game.save

    message = "The game is over, #{killer.nickname} is the winner! Congrats :D"
    send_texts(@game, message)
  end
end

def send_texts(game, message)
  secret_hash = YAML.load_file("super-secret.yml")
  account_sid = secret_hash["development"]["twilio_account_sid"]
  auth_token = secret_hash["development"]["twilio_auth_token"]
  client = Twilio::REST::Client.new account_sid, auth_token

  from = "+18478137513"

  puts message

  game.players.each do |player|
    if player.phone_allowed? == "yes"
      client.account.messages.create(
        from: from,
        to: player.phone,
        body: message
      )
    end
  end
end
