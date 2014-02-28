task :environment do
  require_relative './config/environment'
end

namespace :db do
  task :migrate => [:environment] do
    require_relative './db/migrations/01_create_messages.rb'
    CreateMessages.migrate(:up) if defined?(CreateMessages)
  end
end

task :console => [:environment] do
  Pry.start
end