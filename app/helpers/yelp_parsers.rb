helpers do

  def parse_restaurants(query_args)
    search_result = Yelp::client.search('Chicago, IL', query_args)
    search_result.businesses.collect do |restaurant|
      restaurant_info = {
        :name => restaurant.id,
        :rating => restaurant.rating,
        :rating_count => restaurant.review_count,
        :image_url => restaurant.image_url,
        :latitude => restaurant.location.coordinate.latitude,
        :longitude => restaurant.location.coordinate.longitude,
        :address => restaurant.location.display_address.join(', ')
      }
      unless Restaurant.exists?(restaurant_info)
        new_restaurant = Restaurant.new(restaurant_info)
        new_restaurant.save
      else
        new_restaurant = Restaurant.find_by(restaurant_info)
      end
      new_restaurant
    end
  end

end
