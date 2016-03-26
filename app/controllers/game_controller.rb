get '/' do
  erb :'/index'
end

get '/games' do
  @games = Game.where(status: 'scheduled')
  erb :'/games/index'
end
