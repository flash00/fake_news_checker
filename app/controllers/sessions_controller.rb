get '/login' do
  erb :'users/_login_form'
end

post '/login' do
  @user = User.authenticate(params[:emai], params[:password])
  if @user
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @error_message = ["Invalid email or password"]
    erb :'/sessions/new'
  end
end

get '/logout' do
  session.delete(:id)
  redirect '/'
end