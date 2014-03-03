class CreateCuisines < ActiveRecord::Migration
  def change
    drop_table :cuisines
    create_table :cuisines do |t|
      t.integer :cuisinecode
      t.string :cuisine_description
    end
  end
end