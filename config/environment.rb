require 'bundler/setup'
require 'pry'
Bundler.require(:default) 

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}

VALID_LETTERS = ["B","C","Z"]

ActiveRecord::Base.establish_connection(
   :adapter => "sqlite3",
   :database => 'db/restaurants.db'
)

