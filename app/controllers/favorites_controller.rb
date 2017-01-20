post '/users/favorites' do
  if request.xhr?
    favorite = Favorite.new(user_id: current_user.id, restaurant_id: request['restaurant_id'])
    if favorite.save
      status 200
    else
      status 500
    end
  else
    #normal handling here
  end
end

get '/users/:id/favorites' do
  @favorites = current_user.favorite_restaurants
  erb :'favorites/index'
end
