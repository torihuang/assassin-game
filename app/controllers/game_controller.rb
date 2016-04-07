get '/' do
  erb :'/index'
end

get '/games' do
  @active_games = Game.active_games
  @completed_games = Game.completed_games
  @scheduled_games = Game.scheduled_games

  erb :'games/index'
end

get '/games/new' do
  erb :'games/new'
end

get '/games/:id' do
  @game = Game.find_by(id: params[:id])
  if @game
    erb :'games/show'
  else
    erb :'404'
  end
end

post '/games' do
  @game = Game.new(params[:new_game])
  @game.creator = current_user
  @game.set_default_status
  if @game.save
    redirect "/games/#{@game.id}"
  else
    @errors = @game.errors.full_messages
    erb :'games/new'
  end
end

get '/how_it_works' do
  erb :how_it_works
end
