class RestaurantViolation < ActiveRecord::Base

  belongs_to :restaurants
  belongs_to :violations

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    5000.times do |pp|
      line = f.gets
      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
      next if !Restaurant.exists?(phone: components[6])
      next if !Violation.exists?(vio_code: components[10])
      # if pp == 100
      #   binding.pry
      # end
      rv_array = RestaurantViolation.where(rest_id: Restaurant.find_by(phone: components[6]).id)
      found_dupe = false
      rv_array.each do |rv|
        if rv.vio_id == Violation.find_by(vio_code: components[10]).id
          # puts "duplicate found #{rv.rest_id} #{rv.vio_id}"
          found_dupe = true
        end
      end
      next if found_dupe


      # if RestaurantViolation.exists?(rest_id: (Restaurant.find_by(phone: components[6]).id))
      #   if RestaurantViolation.exists?(vio_id: (Violation.find_by(vio_code: components[10]).id))
      #     next
      #   end
      # end
      join = RestaurantViolation.create
      join.rest_id = Restaurant.find_by(phone: components[6]).id 
      join.vio_id = Violation.find_by(vio_code: components[10]).id 
      join.save
    end
    f.close
  end
end