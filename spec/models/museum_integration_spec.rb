require 'spec_helper'

describe Museum do
  
  describe '.by_region' do
    let!(:region1) { Region.create(name: "region1") }
    let!(:region2) { Region.create(name: "region2") }
    let!(:museum1) { Museum.create(title: "National Museum", region: region1) }
    let!(:museum2) { Museum.create(title: "Another National Museum", region: region2) }
    let!(:museum3) { Museum.create(title: "Sao Paulo Museo", region: region2) }

    it "groups museums by regions" do
      results = Museum.by_region
      results["region1"].should include(museum1)
      results["region2"].should include(museum2)
      results["region2"].should include(museum3)
    end

    it "can search by museum name" do
      results = Museum.by_region "National"
      results["region1"].should include(museum1)
      results["region2"].should include(museum2)
      results["region2"].should_not include(museum3)
    end
  end
end