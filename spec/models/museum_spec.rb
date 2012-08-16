require 'spec_helper'

describe Museum do
  
  describe "#region_name" do

    it "delegates to region" do
      region = mock_model "Region", name: "REGION_NAME"
      museum = Museum.new(region: region)

      museum.region_name.should eq("REGION_NAME")
    end

  end


end
