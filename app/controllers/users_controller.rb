#new
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

#create new user
post '/users' do
  if params[:user][:password] == ""
    @errors = ["Please enter a password."]
    erb :'users/new'
  else
    @user = User.create(params[:user])
    if @user.persisted?
      session[:id] = @user.id
      #redirect '/user/#{@user.id}'
      redirect'/users/#{session[:id]}'
    else
      redirect '/users/new'
    end
  end
end

#show
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end