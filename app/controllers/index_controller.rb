get '/' do
  "Hello!"
end

get '/restaraunts' do
  erb :'restaurants'
end
