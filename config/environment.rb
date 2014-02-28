require 'bundler/setup'
require 'pry'
Bundler.require(:default) 

require_relative '../models/restaurant'
require_relative '../models/violation'
# require_relative '../app'

ActiveRecord::Base.establish_connection(
   :adapter => "sqlite3",
   :database => 'db/restaurants.sqlite3'
)

