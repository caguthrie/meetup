task :environment do
  require_relative './config/environment'
end

namespace :db do
  task :migrate => [:environment] do
    require_relative './db/migrations/01_create_restaurants.rb'
    CreateRestaurants.migrate(:up) if defined?(CreateRestaurants)
  end

  task :seed_restaurants => [:environment] do
    Restaurant.seed
  end
end

task :console => [:environment] do
  Pry.start
end