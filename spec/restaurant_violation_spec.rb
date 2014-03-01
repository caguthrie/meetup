require_relative './spec_helper'

describe RestaurantViolation do 
  before(:each) do
    @rv = RestaurantViolation.new
    @rv.rest_id = 3
    @rv.vio_id = 2
    @rv.save

    @rv2 = RestaurantViolation.new
    @rv2.rest_id = 4
    @rv2.vio_id = 2
    @rv2.save

    @rv3 = RestaurantViolation.new
    @rv3.rest_id = 5
    @rv3.vio_id = 2
    @rv3.save
  end

  after(:each) do
    @violation.destroy
  end

  it "has a restauarant id" do
    expect(RestaurantViolation.find_by(rest_id: 3)).to include(@rv)
  end

  it "has a violation id" do
    expect(RestaurantViolation.find_by(vio_id: 2)).to include(@rv)
  end 

  it "matches restauarant and violations" do
    expect(RestaurantViolation.find_by(vio_id: 2).size).to eq(3)
  end
end