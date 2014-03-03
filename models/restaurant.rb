class Restaurant < ActiveRecord::Base

  has_many :violations, through: :restaurants_violations
  has_one :cuisines

  VALID_LETTERS = ["B","C","Z"]

  def phone_num
    self.phone.to_s.strip.split('').insert(3, "-").insert(7, "-").join()
  end

  # def cuisine_info
  #   self.cuisinecode.cuisine_description
  # end

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

  def get_vio_code
    vio_id_array = RestaurantViolation.where(rest_id: self.id)
    vio_id_array.collect! do |v|
      v.vio_id
    end
    vio_id_array.collect! do |vio_id|
      Violation.where(id: vio_id)
    end
    vio_id_array.collect! do |violation|
      violation.first.vio_code
    end
  end

  def self.zip_list(zip_code)
    Restaurant.where(zip: zip_code)
  end

  def self.create_profile(array)
    array.collect! do |restaurant|
      "#{restaurant.name} #{restaurant.address} ph #{restaurant.phone_num} #{restaurant.get_violations}"
    end
  end

  def address
    @address = "#{self.building_number} #{self.street_name}, #{self.zip}"
    @address
  end

  def self.worst_restaurant_in_zip(zip_code, num=1)
    r = Restaurant.zip_list(zip_code).sort do |a,b|
      if a.score == nil
        1
      elsif b.score == nil
        -1
      else
        b.score <=> a.score
      end
    end

    if num == 1
      r.first
    else
      r[0,num]
    end
  end

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
      next if !VALID_LETTERS.include?(components[12])
      next if components[5].length != 5
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
