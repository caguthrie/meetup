class CreateRestaurantsCuisines < ActiveRecord::Migration
  def change
    drop_table :restaurant_cuisines
    create_table :restaurant_cuisines do |t|
      t.integer :cuisine_id
      t.integer :restaurant_id
    end
  end
end