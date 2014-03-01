require_relative './spec_helper'

describe Restaurant do 
  before(:each) do
    @restaurant = Restaurant.new
    @restaurant.name = "Al's"
    @restaurant.building_number = 32
    @restaurant.street_name = "Main St."
    @restaurant.zip = 11225
    @restaurant.phone = 5555555555
    @restaurant.cuisinecode = 13
    @restaurant.score = 12
    @restaurant.grade = "B"
    # @restaurant.save
  end

  after(:each) do
    # @restaurant.destroy
  end

  it "has a name" do
    expect(Restaurant.find_by(name: "Al's")).to eq(@restaurant)
  end

  it "has a building_number" do
    expect(Restaurant.find_by(building_number: 32)).to eq(@restaurant)
  end 

  it "has a street_name" do
    expect(Restaurant.find_by(street_name: "Main St.")).to eq(@restaurant)
  end

  it "has a zip" do
    expect(Restaurant.find_by(zip: 11225)).to eq(@restaurant)
  end

  it "has a phone" do
    expect(Restaurant.find_by(phone: 5555555555)).to eq(@restaurant)
  end

  it "has a cuisinecode" do
    expect(Restaurant.find_by(cuisinecode: 13)).to eq(@restaurant)
  end

  # it "has a vio_code" do
  #   expect(Restaurant.find_by(vio_code: 06)).to eq(@restaurant)
  # end

  it "has a score" do
    expect(Restaurant.find_by(score: 12)).to eq(@restaurant)
  end

  it "has a grade" do
    expect(Restaurant.find_by(grade: "B")).to eq(@restaurant)
  end

  it "can match to violations" do
    r = Restaurant.new
    r.id = 3

    v = Violation.new
    v.id = 4
    v.description = "first vio"

    v2 = Violation.new
    v2.id = 5
    v2.description = "second vio"

    rv = RestaurantViolation.new
    rv.vio_code = 5
    rv.rest_code = 3

    rv2 = RestaurantViolation.new
    rv2.vio_code = 4
    rv2.rest_code = 3

    expect(r.get_violations).to eq(["first vio", "second vio"])
  end
end