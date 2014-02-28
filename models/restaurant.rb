class Restaurant < ActiveRecord::Base

  def self.seed
    f = File.new("./textfiles/test.txt", 'r')
    f.gets
    while line = f.gets
      components = line.gsub("\"", "").split(",")
      next if components[12] == "A"      
      r = Restaurant.create
      r.name = components[1].downcase.titleize
      r.building_number = components[3]
      r.street_name = components[4].downcase.titleize
      r.zip = components[5]
      r.phone = components[6]
      r.cuisinecode = components[7]
      # r.vio_code = components[10]
      r.score = components[11]
      r.grade = components[12]
      r.save
      # binding.pry
      # puts "here"
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