require "spec_helper"

describe MuseumsController do
  
  describe "GET index" do
    
    context "with no params" do
      
      let(:all_museums) { double "all_museums" }

      it "lists all museums" do
        Museum.stub(:by_region => all_museums)
        get :index 
        controller.museums.should eq(all_museums)
      end

    end

    context "with a search param" do
      
      let(:result_museums) { double "result_museums" }

      it "lists found museums" do
        Museum.should_receive(:by_region).with("the_search").and_return(result_museums)
        get :index, s: "the_search"
        controller.museums.should eq(result_museums)
      end
    end
  end


end