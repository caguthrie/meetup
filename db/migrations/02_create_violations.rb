class CreateViolations < ActiveRecord::Migration
  def change
    drop_table :violations
    create_table :violations do |t|
      t.boolean :critical_vio
      t.string :vio_code
      t.string :description
    end
  end
end

# "STARTDATE","ENDDATE","CRITICALFLAG","VIOLATIONCODE","VIOLATIONDESC"
# "1901-01-01 00:00:00","2003-03-23 00:00:00","Y","01A","Current valid <a    
# onmouseover="ShowContent('P2','01A'); return true;"     
# href="javascript:ShowContent('P2','01A')">permit</A> , registration or other authorization to 
# operate establishment not available."