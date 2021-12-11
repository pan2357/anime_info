require "application_system_test_case"

class MylistsTest < ApplicationSystemTestCase
  setup do
    @mylist = mylists(:one)
  end

  test "visiting the index" do
    visit mylists_url
    assert_selector "h1", text: "Mylists"
  end

  test "creating a Mylist" do
    visit mylists_url
    click_on "New Mylist"

    fill_in "Anime", with: @mylist.anime_id
    fill_in "User", with: @mylist.user_id
    click_on "Create Mylist"

    assert_text "Mylist was successfully created"
    click_on "Back"
  end

  test "updating a Mylist" do
    visit mylists_url
    click_on "Edit", match: :first

    fill_in "Anime", with: @mylist.anime_id
    fill_in "User", with: @mylist.user_id
    click_on "Update Mylist"

    assert_text "Mylist was successfully updated"
    click_on "Back"
  end

  test "destroying a Mylist" do
    visit mylists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mylist was successfully destroyed"
  end
end
