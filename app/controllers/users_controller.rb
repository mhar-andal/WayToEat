post '/users' do
  @user = User.new(params[:user])
  if @user.save
    set_user(@user)
    redirect '/'
  else
    if request.xhr?
    @errors = @user.errors.full_messages
    erb :'/errors/_errors', layout: false
  end
  end
end

post '/sessions' do
  p "login"
  @user = User.find_by(username: params[:user][:username], email: params[:user][:email])
  if @user
    if @user.authenticate(params[:user][:password])
      set_user(@user)
      redirect '/'
    else
      @errors = ["Password is incorrect"]
    end
  else
    if request.xhr?
      @errors = ["Username/email is incorrect"]
      erb :'/errors/_errors', layout: false
    end
  end
end
