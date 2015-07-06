require 'rspec'
require_relative '../lib/zip-codes.rb'

describe ZipCodes do
  
  it "should return a zip code by providing a valid city and state" do
    zip = ZipCodes.identify_by_city_and_state_name({city: "Baltimore", state_name: "Maryland"})
    expect(zip).to eq("21240")
  end
  
  it "should return nil if invalid/not found" do
    zip = ZipCodes.identify_by_city_and_state_name({city: "Fake Place", state_name: "Alaska"})
    expect(zip).to be_nil
  end
  
  it "should be case insensitive" do
    zip = ZipCodes.identify_by_city_and_state_name({city: "bAltImore", state_name: "marYland"})
    expect(zip).to eq("21240")
  end
  
  it "can be aliased by #find" do
    zip = ZipCodes.find({city: "Baltimore", state_name: "Maryland"})
    expect(zip).to eq("21240")
  end
end