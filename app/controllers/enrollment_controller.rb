post '/enrollment' do
  enrollment = Enrollment.new(user: current_user, game_id: params[:game_id])

  if enrollment.save
    redirect "/games/#{params[:game_id]}"
  else
    @errors = enrollment.errors.full_messages
  end
end

put '/enrollments/:user_id' do
end