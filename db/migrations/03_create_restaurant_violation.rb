class CreateRestaurantViolation < ActiveRecord::Migration
  def change
    create_table :restaurants_violations do |t|
      t.integer :vio_id
      t.integer :rest_id
    end
  end
end