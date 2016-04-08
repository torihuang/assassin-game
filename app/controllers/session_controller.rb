get '/session/new' do
  erb :login, layout: false
end

post '/session' do
  if @user = User.authenticate(params[:user_credentials])
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = 'Please enter valid email and password'
    erb :'login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
