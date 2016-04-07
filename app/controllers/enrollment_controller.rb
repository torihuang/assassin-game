post '/enrollment' do
  enrollment = Enrollment.new(user: current_user, game_id: params[:game_id])

  if enrollment.save
    redirect "/games/#{params[:game_id]}"
  else
    @errors = enrollment.errors.full_messages
  end
end

#changing the player's/killer's enrollment record
put '/enrollments/:id' do
  @enrollment = Enrollment.find(params[:id])
  killer = @enrollment.user
  new_corpse = enrollment.target
  new_corpse_enrollment = new_corpse.enrollment.find(@enrollment.id)
  new_corpse_enrollment.killed_by_id = killer.id
  new_corpse_enrollment.save

  killer_enrollment = killer.enrollment
  killer_enrollment.target = new_corpse_enrollment.target
  killer_enrollment.save

  if enrollment.game.active_player_count > 1
    # continue game

  else
    #end game
    # text all players saying that the game is ended?
    # mark end date of game with the current date
    # put game status end
  end
end