require_relative '../config/environment'

puts Geocoder.coordinates(Restaurant.find_by(id: 1).address)

# puts Geocoder.coordinates("11413 Via Playa de Cortes")