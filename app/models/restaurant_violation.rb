class RestaurantViolation < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :violation

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets

      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")

      begin
        d = Date.iso8601(components[8].split(" ")[0])
        r = Restaurant.find_by(phone: components[6].to_i)
        if r != nil
          next if r.date != d.to_s
        else
          next
        end
      rescue
        next
      end

      next if (Date.today - d) > 200      
      
      next if !Violation.exists?(vio_code: components[10])
      rv_array = RestaurantViolation.where(restaurant_id: Restaurant.find_by(phone: components[6]).id)
      found_dupe = false
      rv_array.each do |rv|
        found_dupe = true if rv.violation_id == Violation.find_by(vio_code: components[10]).id
      end
      next if found_dupe

      join = RestaurantViolation.create
      join.restaurant_id = Restaurant.find_by(phone: components[6]).id 
      join.violation_id = Violation.find_by(vio_code: components[10]).id 
      join.save
    end
    f.close
  end
end