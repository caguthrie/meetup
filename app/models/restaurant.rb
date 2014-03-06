class Restaurant < ActiveRecord::Base
  has_many :restaurant_violations
  has_many :violations, through: :restaurant_violations
  has_many :restaurant_cuisines
  has_many :cuisines, through: :restaurant_cuisines

  def phone_num
    self.phone.to_s.strip.split('').insert(3, "-").insert(7, "-").join()
  end

  def self.zip_list(zip_code)
    Restaurant.where(zip: zip_code)
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

#"30191841","DJ REYNOLDS PUB AND RESTAURANT","1","351       ","WEST   57 STREET                                  ","10019","2122452912","03","2013-07-22 00:00:00","D","10F","11","A","2013-07-22 00:00:00","2014-02-20 06:01:08.513000000"
  def self.seed
    f = File.new("./textfiles/WebExtract.txt", 'r')
    f.gets
    while line = f.gets
      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
      begin
        d = Date.iso8601(components[8].split(" ")[0])
        r = Restaurant.find_by(phone: components[6].to_i)
        if r != nil
          if r.date < d.to_s
            if !VALID_LETTERS.include?(components[12])
              r.destroy
            else
              r.date = d.to_s
              r.save
            end
          end
          next
        end
      rescue
        next
      end

      next if (Date.today - d) > 200
      next if !VALID_LETTERS.include?(components[12])
      next if components[5].length != 5
      
      r = Restaurant.create
      r.name = components[1].downcase.titleize
      r.building_number = components[3].to_i
      r.street_name = components[4].downcase.titleize
      r.zip = components[5].to_i
      r.phone = components[6].to_i
      r.cuisinecode = components[7].to_i
      r.date = d.to_s
      r.score = components[11].to_i
      r.grade = components[12]
      r.save
    end
    f.close
  end
end
