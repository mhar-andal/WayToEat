get '/restaurants' do
  if request.xhr?
    query_params = {
      :term => 'food',
      :radius_filter => 2400,
      :limit => 20,
      :coordinates => {latitude: request[:latitude], longitude: request[:longitude]}
    }

     @restaurants = parse_restaurants(query_params)
     erb :'restaurants/_show', layout: false
  end
end
     # .collect{|restaurant| {:"#{restaurant.id}" => restaurant.as_json}}
     # content_type :json
     #  @restaurants.join("")
