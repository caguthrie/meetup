class CreateRestaurantViolation < ActiveRecord::Migration
  def change
    drop_table :restaurant_violations
    create_table :restaurant_violations do |t|
      t.integer :vio_id
      t.integer :rest_id
    end
  end
end