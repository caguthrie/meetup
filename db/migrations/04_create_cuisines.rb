class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :cuisinecode
      t.string :description
    end
  end
end