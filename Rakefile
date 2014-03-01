task :environment do
  require_relative './config/environment'
end

namespace :db do
  task :migrate => [:environment] do
    # require_relative './db/migrations/01_create_restaurants.rb'
    # require_relative './db/migrations/02_create_violations.rb'
    require_relative './db/migrations/03_create_restaurant_violation.rb'
    CreateRestaurantViolation.migrate(:up) if defined?(CreateRestaurantViolation)
    # CreateRestaurants.migrate(:up) if defined?(CreateRestaurants)
    # CreateViolations.migrate(:up) if defined?(CreateViolations)
  end

  # task :rollback => [:environment] do
  #   require_relative './db/migrations/01_create_restaurants.rb'
  #   CreateRestaurants.migrate(:down) if defined?(CreateRestaurants)    
  # end

  task :seed => [:environment] do
    # Restaurant.seed
    # Violation.seed
    RestaurantViolation.seed
  end
end

task :console => [:environment] do
  Pry.start
end