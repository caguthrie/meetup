require 'bundler/setup'
Bundler.require(:default) 

require_relative '../models/message'
require_relative '../app'

ActiveRecord::Base.establish_connection(
   :adapter => "sqlite3",
   :database => 'db/development.sqlite3'
)