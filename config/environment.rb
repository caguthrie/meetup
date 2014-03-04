require 'bundler/setup'
require 'pry'
Bundler.require(:default) 

require_relative '../models/restaurant'
require_relative '../models/violation'
require_relative '../models/restaurant_violation'
require_relative '../models/restaurant_cuisine'
require_relative '../models/cuisine'
require_relative '../spec/restaurant_violation_spec.rb'
require_relative '../spec/restaurant_spec.rb'
require_relative '../spec/violation_spec.rb'
require_relative '../app'

ActiveRecord::Base.establish_connection(
   :adapter => "sqlite3",
   :database => 'db/restaurants.db'
)

