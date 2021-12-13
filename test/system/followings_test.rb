require "application_system_test_case"

class FollowingsTest < ApplicationSystemTestCase

  test "follow when not logged in" do
    # at home page
    visit home_path
    first('[value="Follow"]').click
    assert_text "Please log in first"

    # at anime page
    visit home_path
    click_link "a1name"
    first('[value="Follow"]').click
    assert_text "Please log in first"
  end

  test "like when logged in" do
    # log in
    visit login_path
    fill_in "Email", with: "smith@mail.com"
    fill_in "Password", with: "testpassword"
    click_on "Login"
    assert_text "You are logged in as : John"

    # at home page
    visit home_path
    page.all('[value="Follow"]').last.click
    assert_selector "[value='Unfollow']"
    find('[value="Unfollow"]').click

    # at anime page
    click_link "a2name"
    find('[value="Follow"]').click
    assert_selector "[value='Unfollow']"

    # check to see if all the animes that we have followed show up on the feed page
    click_link "Feed"
    assert_link "a2name"
    find('[value="Unfollow"]').click
    assert_no_link "a2name"
  end
end
