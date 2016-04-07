post '/enrollment' do
  enrollment = Enrollment.new(user: current_user, game_id: params[:game_id])

  if enrollment.save
    redirect "/games/#{params[:game_id]}"
  else
    @errors = enrollment.errors.full_messages
  end
end

put '/enrollments/:id' do
  @enrollment = Enrollment.find(params[:id])

  if enrollment.game.active_player_count > 0
    # continue game
  else
    #end game
  end

end