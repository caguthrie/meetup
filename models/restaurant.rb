class Restaurant < ActiveRecord::Base

  has_many :violations, through: :restaurants_violations

  VALID_LETTERS = ["B","C","Z"]

  def phone
    @phone.to_s.split('').insert(3, "-").insert(7, "-").join()
  end

  def get_violations
    vio_id_array = RestaurantViolations.find_by(id: self.id).vio_id
    vio_id_array.collect do |vio_id|
      Violation.find_by(id: vio_id).description
    end
  end

  def address
    @address = "#{self.building_number} #{self.street_name} #{zip}"
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