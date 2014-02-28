class Restaurant < ActiveRecord::Base

  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets
      components = line.gsub("\"", "").split(",")
      next if components[12] == "A"
      next if components[5].length != 5 # Come back to this zip code
      next if Restaurant.exists? phone: components[6].to_i
      
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