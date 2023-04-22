require "rails_helper"

RSpec.feature "TierLists", type: :feature do
    context "Update tier_list" do
      let(:tier_list) {
        TierList.create(name: "Test name", description: "Test content", numTiers: 5)
      }
      before(:each) do
          user = FactoryBot.create(:user)
          login_as(user)
          visit edit_tier_list_path(tier_list)      
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Tier list"
        expect(page).to have_content("Tier list was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Tier list"
        expect(page).to have_content("Description can't be blank")
      end

      #my code
      scenario "should fail name" do
        within("form") do
          fill_in "Name", with: ""
        end
        click_button "Update Tier list"
        expect(page).to have_content("Name can't be blank")
      end
    end

    context "Create tier_list" do
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_tier_list_path
      end

      scenario "successful create" do
        within("form") do
          fill_in "Description", with: "New description content"
          fill_in "Name", with: "New name"
          fill_in "tier_list[numTiers]", with: 3

        end
        click_button "Create Tier list"
        expect(page).to have_content("Tier list was successfully created")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Create Tier list"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail name" do
        within("form") do
          fill_in "Name", with: ""
        end
        click_button "Create Tier list"
        expect(page).to have_content("Name can't be blank")
      end
    end
end
