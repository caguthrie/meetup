class Cuisine < ActiveRecord::Base

  belongs_to :restaurants
  
  def self.seed
    f = File.new("./textfiles/Cuisine.txt", 'r')
    f.gets
    while line = f.gets
      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub(/<\/?.*?>/, "").gsub("\"", "").split(",") # .gsub(/<.+>/, "")
      next if !Restaurant.exists?(cuisinecode: components[0])
      # next if Violation.find_by vio_code: components[3] != nil
      c = Cuisine.create
      c.cuisinecode = components[0]
      c.cuisine_description = components[1]
      c.save
    end
    f.close
  end
end