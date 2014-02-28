# Define a Migration that will create a messages table with columns:

# from that is a string
# content that is text
# timestamps

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :content
      t.timestamps
    end
  end
end