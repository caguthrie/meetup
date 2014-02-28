class Violation < ActiveRecord::Base

  def self.seed
    f = File.new("./textfiles/short_vio.txt", 'r')
    f.gets
    while line = f.gets
      components = line.gsub(/<\/?.*?>/, "").gsub("\"", "").split(",") # .gsub(/<.+>/, "")
      next if Violation.find_by vio_code: components[3] != nil
      v = Violation.create
      components[2] == "Y" ? v.critical_vio = true : v.critical_vio = false
      v.vio_code = components[3]
      v.description = components[4]
      v.save
      # binding.pry
      # puts "here"
    end
    f.close
  end
end


# "STARTDATE","ENDDATE","CRITICALFLAG","VIOLATIONCODE","VIOLATIONDESC"
# "1901-01-01 00:00:00","2003-03-23 00:00:00","Y","01A","Current valid <a    onmouseover="ShowContent('P2','01A'); return true;"     href="javascript:ShowContent('P2','01A')">permit</A> , registration or other authorization to operate establishment not available."