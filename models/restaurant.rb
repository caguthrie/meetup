class Restaurant < ActiveRecord::Base

  has_many :violations, through: :restaurants_violations

  VALID_LETTERS = ["B","C","Z"]

  def phone_num
    self.phone.to_s.strip.split('').insert(3, "-").insert(7, "-").join()
  end

  def get_violations
    vio_id_array = RestaurantViolation.where(rest_id: self.id)
    vio_id_array.collect! do |v|
      v.vio_id
    end
    vio_id_array.collect! do |vio_id|
      Violation.where(id: vio_id)
    end
    vio_id_array.collect! do |violation|
      violation.first.description
    end

  end

  def self.zip_list(zip_code)
    Restaurant.where(zip: zip_code).each do |restaurant|
      puts restaurant.name
    end
    Restaurant.where(zip: zip_code)
  end

  def self.create_profile(array)
    array.collect! do |restaurant|
      # binding.pry
      "#{restaurant.name} #{restaurant.address} ph #{restaurant.phone_num} #{restaurant.get_violations}"
      # restaurant.name
      # restaurant.address
      # restaurant.phone
      # restaurant.get_violations
    end
   puts array
  end

  def address
    @address = "#{self.building_number} #{self.street_name} #{self.zip}"
    @address
  end

  def map_address
  end

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets
      # begin
        components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
      # rescue ArgumentError
      #   return true
      # end

      next if !VALID_LETTERS.include?(components[12])
      next if components[5].length != 5 # Come back to this zip code
      next if Restaurant.exists?(phone: components[6].to_i)
      
      r = Restaurant.create
      r.name = components[1].downcase.titleize
      r.building_number = components[3].to_i
      r.street_name = components[4].downcase.titleize
      r.zip = components[5].to_i
      r.phone = components[6].to_i
      r.cuisinecode = components[7].to_i
      r.score = components[11].to_i
      r.grade = components[12]
      r.save
    end
    f.close
  end
end

      # t.string :name
      # t.integer :building_number
      # t.string :street_name
      # t.integer :zip
      # t.integer :phone
      # t.integer :cuisinecode
      # t.integer :vio_code
      # t.integer :score
      # t.string :grade

# "CAMIS","DBA","BORO","BUILDING","STREET","ZIPCODE","PHONE","CUISINECODE",
# "INSPDATE","ACTION","VIOLCODE","SCORE","CURRENTGRADE","GRADEDATE","RECORDDATE"