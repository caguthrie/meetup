require_relative '../config/environment'

# print put bad restrautns in the db
r = Restaurant.zip_list(11221)
binding.pry
Restaurant.create_profile(r)

# prints out restraunts and 