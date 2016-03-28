get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  redirect '/' unless authenticate

  @user = User.find(session[:user_id])
  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user_credentials])
  password_input = params[:user_credentials][:password]
  if @user && password_valid(password_input)
    @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    @errors << "Password must be at least six characters, include one special character, and one number" unless password_valid(password_input)
    erb :'users/new'
  end
end
