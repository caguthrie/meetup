class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.integer :cuisinecode
      t.string :cuisine_description
    end
  end
end