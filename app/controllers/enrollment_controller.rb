#EB NOTE
# Currently, it still lists that player's next target from their most recent enrollment on their show page. That's a thing to configure. I tested this code by seeding the DB with 3 users and killing them one after the other, it seems to work. -EB
put '/enrollments/:id' do
  @enrollment = Enrollment.find(params[:id])
  killer = @enrollment.user
  game = @enrollment.game
  puts "=================ENROLLMENT ID=================="
  puts @enrollment.id
  puts "==================================="

  new_corpse = @enrollment.target

  new_corpse_record = new_corpse.enrollments.find_by(game_id: game.id)
  new_corpse_record.update(killed_by_id: killer.id)
  # new_corpse_record.save
  killer.increment!(:kill_count)
  # binding.pry
  message = ""
  puts "iiiiiiiiiiiiiiiiiii"
  puts @enrollment.game.active_player_count
  puts "||||||||||||||||||||||||||||||||||||"
  if @enrollment.game.active_player_count > 1
    # continue game
    puts "================ CONTINUES===================="
    killer_record = killer.enrollments.find_by(game_id: game.id)
    killer_record.target = new_corpse_record.target
    killer_record.save

    message = "#{@enrollment.target.nickname} was assassinated by #{killer.nickname}! Watch out, you never know who might be next..."
    #send_texts(game, message)
    redirect "/users/#{killer.id}"
  else
    # end game
    puts "================GAME OVER===================="
    killer.increment!(:win_count)
    @game = @enrollment.game
    puts @game
    puts @game.status
    @game.update!(status: "completed", winner_id: killer.id, end_date: DateTime.now.to_s)
    puts @game.status
    puts "Congratulations, #{killer}!"
    # @game.save
    redirect "/games/#{ @game.id }"
    message = "The game is over, #{killer.nickname} is the winner! Congrats :D"
    # send_texts(@game, message)
  end
end

def send_texts(game, message)
  account_sid = ENV["TWILIOSID"]
  auth_token = ENV["TWILIOTOKEN"]
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
