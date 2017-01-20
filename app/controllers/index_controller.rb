get '/' do
  if logged_in?
    erb :'index'
  else
    erb :'/users/login'
  end
end

get '/restaraunts' do
  erb :'restaurants'
end
