post '/users' do
  @user = User.new(params[:user])
  if @user.save
    if request.xhr?
      set_user(@user)
      redirect '/'
    end
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
      @errors = ["Username/email/password is incorrect"]
      erb :'/errors/_errors', layout: false
    end
  else
    if request.xhr?
      @errors = ["Username/email/password is incorrect"]
      erb :'/errors/_errors', layout: false
    end
  end
end

delete '/sessions' do
  session.clear
  redirect '/'
end
