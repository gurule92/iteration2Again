require "application_system_test_case"

class TierListItemsTest < ApplicationSystemTestCase
  setup do
    @tier_list_item = tier_list_items(:one)
  end

  test "visiting the index" do
    visit tier_list_items_url
    assert_selector "h1", text: "Tier List Items"
  end

  test "creating a Tier list item" do
    visit tier_list_items_url
    click_on "New Tier List Item"

    fill_in "Description", with: @tier_list_item.description
    fill_in "Justification", with: @tier_list_item.justification
    fill_in "Name", with: @tier_list_item.name
    fill_in "Tier", with: @tier_list_item.tier
    fill_in "Tier list", with: @tier_list_item.tier_list_id
    click_on "Create Tier list item"

    assert_text "Tier list item was successfully created"
    click_on "Back"
  end

  test "updating a Tier list item" do
    visit tier_list_items_url
    click_on "Edit", match: :first

    fill_in "Description", with: @tier_list_item.description
    fill_in "Justification", with: @tier_list_item.justification
    fill_in "Name", with: @tier_list_item.name
    fill_in "Tier", with: @tier_list_item.tier
    fill_in "Tier list", with: @tier_list_item.tier_list_id
    click_on "Update Tier list item"

    assert_text "Tier list item was successfully updated"
    click_on "Back"
  end

  test "destroying a Tier list item" do
    visit tier_list_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tier list item was successfully destroyed"
  end
end
