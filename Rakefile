task :environment do
  require_relative './config/environment'
end

namespace :db do
  task :migrate => [:environment] do
    # require_relative './db/migrations/01_create_restaurants.rb'
    require_relative './db/migrations/02_create_violations.rb'
    # require_relative './db/migrations/04_create_cuisines.rb'
    # require_relative './db/migrations/05_create_restaurants_cuisines.rb'
    require_relative './db/migrations/03_create_restaurant_violations.rb'
    CreateRestaurantViolations.migrate(:up) if defined?(CreateRestaurantViolations)
    # CreateRestaurants.migrate(:up) if defined?(CreateRestaurants)
    CreateViolations.migrate(:up) if defined?(CreateViolations)
    # CreateCuisines.migrate(:up) if defined?(CreateCuisines)
    # CreateRestaurantsCuisines.migrate(:up) if defined?(CreateRestaurantsCuisines)
  end

  # task :rollback => [:environment] do
  #   require_relative './db/migrations/01_create_restaurants.rb'
  #   CreateRestaurants.migrate(:down) if defined?(CreateRestaurants)    
  # end

  task :seed => [:environment] do
    # Restaurant.seed
    Violation.seed
    RestaurantViolation.seed
     # Cuisine.seed
     # RestaurantCuisine.seed
  end
end

task :console => [:environment] do
  Pry.start
end