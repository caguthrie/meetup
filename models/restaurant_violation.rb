class RestaurantViolation < ActiveRecord::Base

  belongs_to :restaurants
  belongs_to :violations

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets

      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")

      begin
        d = Date.iso8601(components[8].split(" ")[0])
      rescue
        next
      end

      next if (Date.today - d) > 200      
      
      next if !Restaurant.exists?(phone: components[6])
      next if !Violation.exists?(vio_code: components[10])
      rv_array = RestaurantViolation.where(rest_id: Restaurant.find_by(phone: components[6]).id)
      found_dupe = false
      rv_array.each do |rv|
        found_dupe = true if rv.vio_id == Violation.find_by(vio_code: components[10]).id
      end
      next if found_dupe

      join = RestaurantViolation.create
      join.rest_id = Restaurant.find_by(phone: components[6]).id 
      join.vio_id = Violation.find_by(vio_code: components[10]).id 
      join.save
    end
    f.close
  end
end