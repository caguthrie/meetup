class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :building_number
      t.string :street_name
      t.integer :zip
      t.integer :phone
      t.integer :cuisinecode
      # t.integer :vio_code
      t.integer :score
      t.string :grade
    end
  end
end

# "CAMIS","DBA","BORO","BUILDING","STREET","ZIPCODE","PHONE","CUISINECODE",
# "INSPDATE","ACTION","VIOLCODE","SCORE","CURRENTGRADE","GRADEDATE","RECORDDATE"