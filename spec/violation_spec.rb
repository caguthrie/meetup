require_relative './spec_helper'

describe Violation do 
  before(:each) do
    @violation = Violation.new
    @violation.vio_code = "10F"
    @violation.critical_vio = true
    @violation.description = "hello"
    # @violation.save
  end

  after(:each) do
    # @violation.destroy
  end

  it "has a code" do
    expect(Violation.find_by(vio_code: "10F")).to eq(@violation)
  end

  it "has a critical flag" do
    expect(Violation.find_by(critical_vio: true)).to eq(@violation)
  end 

  it "has a description" do
    expect(Violation.find_by(description: "hello")).to eq(@violation)
  end

end