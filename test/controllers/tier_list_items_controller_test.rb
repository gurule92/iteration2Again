require "test_helper"

class TierListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tier_list_item = tier_list_items(:one)
  end

  test "should get index" do
    get tier_list_items_url
    assert_response :success
  end

  test "should get new" do
    get new_tier_list_item_url
    assert_response :success
  end

  test "should create tier_list_item" do
    assert_difference('TierListItem.count') do
      post tier_list_items_url, params: { tier_list_item: { description: @tier_list_item.description, justification: @tier_list_item.justification, name: @tier_list_item.name, tier: @tier_list_item.tier, tier_list_id: @tier_list_item.tier_list_id } }
    end

    assert_redirected_to tier_list_item_url(TierListItem.last)
  end

  test "should show tier_list_item" do
    get tier_list_item_url(@tier_list_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_tier_list_item_url(@tier_list_item)
    assert_response :success
  end

  test "should update tier_list_item" do
    patch tier_list_item_url(@tier_list_item), params: { tier_list_item: { description: @tier_list_item.description, justification: @tier_list_item.justification, name: @tier_list_item.name, tier: @tier_list_item.tier, tier_list_id: @tier_list_item.tier_list_id } }
    assert_redirected_to tier_list_item_url(@tier_list_item)
  end

  test "should destroy tier_list_item" do
    assert_difference('TierListItem.count', -1) do
      delete tier_list_item_url(@tier_list_item)
    end

    assert_redirected_to tier_list_items_url
  end
end
