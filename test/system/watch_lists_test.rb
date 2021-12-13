require "application_system_test_case"

class WatchListsTest < ApplicationSystemTestCase
  test "add to watch list when not logged in" do
    visit home_path
    click_link "a1name"
    find('[value="Add to Watch List"]').click
    assert_text "Please log in first"
  end

  test "add to watch list when logged in" do
    # log in
    visit login_path
    fill_in "Email", with: "smith@mail.com"
    fill_in "Password", with: "testpassword"
    click_on "Login"
    assert_text "You are logged in as : John"

    # at anime page
    visit home_path
    click_link "a1name"
    find('[value="Add to Watch List"]').click
    assert_selector '[value="Remove from Watch List"]'

    # at watch list page
    # check to see if the anime that we added to Watch List show up on Watch List page
    click_link "Watch List"
    assert_link "a1name"
    find('[value="Remove"]').click
    assert_no_link "a1name"

    visit home_path
    click_link "a1name"
    assert_selector '[value="Add to Watch List"]'
    assert_no_selector '[value="Remove from Watch List"]'
  end 
end
