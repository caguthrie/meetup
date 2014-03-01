class RestaurantViolation < ActiveRecord::Base

  belongs_to :restaurants
  belongs_to :violations

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets
      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
      next if !Restaurant.exists?(phone: components[6])
      next if !Violation.exists?(vio_code: components[10])
      join = RestaurantViolation.create
      join.rest_id = Restaurant.find_by(phone: components[6]).id 
      join.vio_id = Violation.find_by(vio_code: components[10]).id 
      join.save
    end
    f.close
  end
end