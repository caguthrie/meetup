class RestaurantViolations < ActiveRecord::Base

  belongs_to :restaurants
  belongs_to :violations

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets
        components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")

      next if !VALID_LETTERS.include?(components[12])
      next if components[5].length != 5 # Come back to this zip code
      next if Restaurant.exists?(phone: components[6].to_i)
      
      join = RestaurantViolations.create
      join.vio_code = components[10]
      join.rest_phone = components[6]

      join.rest_id = Restaurant.find_by(phone: join.rest_phone).id 
      join.vio_id = Violation.find_by(vio_code: join.vio_code).id 
      join.save
    end
    f.close
  end
end