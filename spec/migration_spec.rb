describe "Restaurant" do 
  before(:each) do
    @restaurant = Restaurant.new
    @restaurant.name = "Al's"
    @restaurant.building_number = 32
    @restaurant.street_name = "Main St."
    @restaurant.zip = 11225
    @restaurant.phone = 5555555555
    @restaurant.cuisinecode = 13
    @restaurant.vio_code = 06
    @restaurant.score = 12
    @restaurant.grade = "A"

  subject(:restaurant) { @restaurant }

  it "has a name" do
    expect(subject.find_by(name: "Al's")).to eq(@restaurant))
  end

  it "has a building_number" do
    expect(subject.find_by(building_number: 32)).to eq(@restaurant))
  end 

  it "has a street_name" do
    expect(subject.find_by(street_name: "Main St.")).to eq(@restaurant))
  end

  it "has a zip" do
    expect(subject.find_by(zip: 11225)).to eq(@restaurant))
  end

  it "has a phone" do
    expect(subject.find_by(phone: 5555555555)).to eq(@restaurant))
  end

  it "has a cuisinecode" do
    expect(subject.find_by(cuisinecode: 13)).to eq(@restaurant))
  end

  it "has a vio_code" do
    expect(subject.find_by(vio_code: 06)).to eq(@restaurant))
  end

  it "has a score" do
    expect(subject.find_by(score: 12)).to eq(@restaurant))
  end

  it "has a grade" do
    expect(subject.find_by(grade: "A")).to eq(@restaurant))
  end
end