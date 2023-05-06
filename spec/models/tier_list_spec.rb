require "rails_helper"

describe "TierList Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the name is present when creating tier_list" do
      tier_list = TierList.new(description: "Content of the description", numTiers: "2")
      expect(tier_list.valid?).to eq(false)
    end
    it "ensures the description is present when creating tier_list" do
        tier_list = TierList.new(name: "tier_list", numTiers: "2")
        expect(tier_list.valid?).to eq(false)
    end
    it "should not be able to save tier_list when name missing" do
      tier_list = TierList.new(description: "Some description content goes here", numTiers: "2")
      expect(tier_list.save).to eq(false)
    end
    it "should be able to save tier_list when have description, numtiers and name" do
      tier_list = TierList.new(name: "name", description: "Content of the description", numTiers: "2")
      expect(tier_list.save).to eq(true)
    end
  end
end

describe "TierList Attribute Requirements on Edit", :type => :model do
  context "Edit tier_list" do  
    before (:each) do
      @tier_list = TierList.create(name: "name", description: "Content of the description", numTiers: 2)
 
      end
    it "ensures the name is present when editing tier_list" do
      @tier_list.update(:name => "New name")
      expect(@tier_list.name == "New name")
    end
    it "ensures the descriptino is present when editing tier_list" do
        @tier_list.update(:description => "New descript")
        expect(@tier_list.description == "New descript")
      end
      it "ensures the numTiers is present when editing tier_list" do
        @tier_list.update(:numTiers => 3)
        expect(@tier_list.numTiers == 3)
      end
  end
end