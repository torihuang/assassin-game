get '/' do
  erb :'/index'
end

get '/games' do
  @active_games = Game.active_games
  @completed_games = Game.completed_games
  @scheduled_games = Game.scheduled_games

  erb :'games/index'
end
