class CreateRestAndVio < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :to
      t.string :from
      t.string :content
      t.timestamps
    end
  end
end