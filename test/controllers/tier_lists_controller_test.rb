require "test_helper"

class TierListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tier_list = tier_lists(:one)
  end

  test "should get index" do
    get tier_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_tier_list_url
    assert_response :success
  end

  test "should create tier_list" do
    assert_difference('TierList.count') do
      post tier_lists_url, params: { tier_list: { description: @tier_list.description, name: @tier_list.name, numTiers: @tier_list.numTiers } }
    end

    assert_redirected_to tier_list_url(TierList.last)
  end

  test "should show tier_list" do
    get tier_list_url(@tier_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_tier_list_url(@tier_list)
    assert_response :success
  end

  test "should update tier_list" do
    patch tier_list_url(@tier_list), params: { tier_list: { description: @tier_list.description, name: @tier_list.name, numTiers: @tier_list.numTiers } }
    assert_redirected_to tier_list_url(@tier_list)
  end

  test "should destroy tier_list" do
    assert_difference('TierList.count', -1) do
      delete tier_list_url(@tier_list)
    end

    assert_redirected_to tier_lists_url
  end
end
