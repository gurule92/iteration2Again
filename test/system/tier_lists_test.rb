require "application_system_test_case"

class TierListsTest < ApplicationSystemTestCase
  setup do
    @tier_list = tier_lists(:one)
  end

  test "visiting the index" do
    visit tier_lists_url
    assert_selector "h1", text: "Tier Lists"
  end

  test "creating a Tier list" do
    visit tier_lists_url
    click_on "New Tier List"

    fill_in "Description", with: @tier_list.description
    fill_in "Name", with: @tier_list.name
    fill_in "Numtiers", with: @tier_list.numTiers
    click_on "Create Tier list"

    assert_text "Tier list was successfully created"
    click_on "Back"
  end

  test "updating a Tier list" do
    visit tier_lists_url
    click_on "Edit", match: :first

    fill_in "Description", with: @tier_list.description
    fill_in "Name", with: @tier_list.name
    fill_in "Numtiers", with: @tier_list.numTiers
    click_on "Update Tier list"

    assert_text "Tier list was successfully updated"
    click_on "Back"
  end

  test "destroying a Tier list" do
    visit tier_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tier list was successfully destroyed"
  end
end
