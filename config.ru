# config.ru
require './config/environment'

run RestaurantApp

$stdout.sync = true
