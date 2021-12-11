require "test_helper"

class MylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mylist = mylists(:one)
  end

  test "should get index" do
    get mylists_url
    assert_response :success
  end

  test "should get new" do
    get new_mylist_url
    assert_response :success
  end

  test "should create mylist" do
    assert_difference('Mylist.count') do
      post mylists_url, params: { mylist: { anime_id: @mylist.anime_id, user_id: @mylist.user_id } }
    end

    assert_redirected_to mylist_url(Mylist.last)
  end

  test "should show mylist" do
    get mylist_url(@mylist)
    assert_response :success
  end

  test "should get edit" do
    get edit_mylist_url(@mylist)
    assert_response :success
  end

  test "should update mylist" do
    patch mylist_url(@mylist), params: { mylist: { anime_id: @mylist.anime_id, user_id: @mylist.user_id } }
    assert_redirected_to mylist_url(@mylist)
  end

  test "should destroy mylist" do
    assert_difference('Mylist.count', -1) do
      delete mylist_url(@mylist)
    end

    assert_redirected_to mylists_url
  end
end
