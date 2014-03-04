class RestaurantCuisine < ActiveRecord::Base

  belongs_to :restaurants
  belongs_to :cuisines

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets
      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
      next if !Restaurant.exists?(phone: components[6])
      next if !Cuisine.exists?(cuisinecode: components[7])

      join = RestaurantCuisine.create
      join.restaurant_id = Restaurant.find_by(phone: components[6]).id 
      join.cuisine_id = Cuisine.find_by(cuisinecode: components[7]).id 
      join.save
    end
    f.close
  end
end