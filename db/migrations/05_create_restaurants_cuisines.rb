class CreateRestaurantsCuisines < ActiveRecord::Migration
  def change
    create_table :restaurant_cuisines do |t|
      t.integer :cuisine_id
      t.integer :rest_id
    end
  end
end