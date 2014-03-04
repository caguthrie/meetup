require_relative './spec_helper'

describe RestaurantViolation do 
  before(:each) do
    @rv = RestaurantViolation.new
    @rv.restaurant_id = 3
    @rv.violation_id = 2
    # @rv.save

    @rv2 = RestaurantViolation.new
    @rv2.restaurant_id = 4
    @rv2.violation_id = 2
    # @rv2.save

    @rv3 = RestaurantViolation.new
    @rv3.restaurant_id = 5
    @rv3.violation_id = 2
    # @rv3.save
  end

  after(:each) do
    # @violation.destroy
  end

  it "has a restauarant id" do
    expect(RestaurantViolation.find(restaurant_id: 3)).to include(@rv)
  end

  it "has a violation id" do
    expect(RestaurantViolation.find(violation_id: 2)).to include(@rv)
  end 

  it "matches restauarant and violations" do
    expect(RestaurantViolation.find(violation_id: 2).size).to eq(3)
  end
end