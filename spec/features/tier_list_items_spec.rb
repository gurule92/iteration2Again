require 'rails_helper'

RSpec.feature "TierListItems", type: :feature do
    let(:user) { create(:user) }
    let(:tier_list) { create(:tier_list) }     
    let!(:tier_list_item) { create(:tier_list_item, tier_list: tier_list) }

  before(:each) do
    login_as(user) 
  end
  scenario 'User creates a new tier list item' do
    visit new_tier_list_tier_list_item_path(tier_list)

    fill_in 'Name', with: 'Tier List Item Name'
    fill_in 'Tier', with: 1
    fill_in 'Justification', with: 'This is the justification for the tier list item'
    fill_in 'Description', with: 'This is the description of the tier list item'
    click_button 'Create Tier list item'
    expect(page).to have_content('Tier list item was successfully created')
    expect(page).to have_content('Tier List Item Name')


  end
  scenario "successfully editing a tier list item" do
    visit edit_tier_list_tier_list_item_path(tier_list, tier_list_item)
    fill_in "Name", with: "Updated Tier List Item"
    fill_in "Tier", with: 2
    fill_in "Justification", with: "Updated justification"
    fill_in "Description", with: "Updated description"
    click_button "Update Tier list item"

    expect(page).to have_content("Tier list item was successfully updated")
    expect(page).to have_content("Updated Tier List Item")
    expect(page).to have_content("Updated justification")
    expect(page).to have_content("Updated description")
  end

  scenario "unsuccessfully editing a tier list item with invalid data" do
    visit edit_tier_list_tier_list_item_path(tier_list, tier_list_item)
    fill_in "Name", with: ""
    click_button "Update Tier list item"

    expect(page).to have_content("Name can't be blank")
  end
end
