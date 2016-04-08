post '/addresses' do
  uri = URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:address]}&key=#{ENV["GEOAPI"]}")
  response = Net::HTTP.get(uri)
  content_type :json
  response
end
