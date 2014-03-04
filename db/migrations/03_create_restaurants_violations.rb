class CreateRestaurantsViolations < ActiveRecord::Migration
  def change
    create_table :restaurants_violations do |t|
      t.integer :violation_id
      t.integer :restaurant_id
    end
  end
end