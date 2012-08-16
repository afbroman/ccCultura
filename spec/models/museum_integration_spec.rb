require 'spec_helper'

describe Museum do
  
  describe '.by_region' do
    let!(:region1) { Region.create(name: "region1") }
    let!(:region2) { Region.create(name: "region2") }
    let!(:museum1) { Museum.create(title: "museum1", region: region1) }
    let!(:museum2) { Museum.create(title: "museum2", region: region2) }
    let!(:museum3) { Museum.create(title: "museum3", region: region2) }

    it "groups museums by regions" do
      results = Museum.by_region
      results[region1].should include(museum1)
      results[region2].should include(museum2)
      results[region2].should include(museum3)
    end


  end

end