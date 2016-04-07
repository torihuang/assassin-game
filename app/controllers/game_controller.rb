get '/' do
  erb :'/index'
end

get '/games' do
  @active_games = Game.active_games
  @completed_games = Game.completed_games
  @scheduled_games = Game.scheduled_games

  erb :'games/index'
end

get '/games/:id/start' do
  game = Game.find_by(id: params[:id])
  if game

  else
    erb :'404'
  end
end

get '/games/:id' do
  @game = Game.find_by(id: params[:id])
  if @game
    erb :'games/show'
  else
    erb :'404'
  end
end

get '/how_it_works' do
  erb :how_it_works
end
