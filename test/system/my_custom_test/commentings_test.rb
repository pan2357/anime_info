require "application_system_test_case"

class CommentingsTest < ApplicationSystemTestCase

  test "comment when not logged in" do
    # at anime page
    visit anime_page_path("a1name")
    click_on "Submit Comment"
    assert_text "Please log in first"

    # at source page
    visit source_page_path("s1name")
    click_on "Submit Comment"
    assert_text "Please log in first"

    # at news page
    visit news_page_path(news(:n1).id)
    click_on "Submit Comment"
    assert_text "Please log in first"
  end

  test "comment when logged in" do
    # log in
    visit login_path
    fill_in "Email", with: "smith@mail.com"
    fill_in "Password", with: "testpassword"
    click_on "Login"
    assert_text "You are logged in as : John"

    # at anime page
    visit home_path
    click_link "a1name"
    assert_no_text "John"
    fill_in "Msg", with: "test comment by John"
    click_on "Submit Comment"
    assert_text "John"
    assert_text "test comment by John"
    click_on "Delete"
    assert_no_text "John"
    assert_no_text "test comment by John"

    # at source page
    click_link "Game"
    assert_no_text "John"
    fill_in "Msg", with: "test comment by John"
    click_on "Submit Comment"
    assert_text "John"
    assert_text "test comment by John"
    click_on "Delete"
    assert_no_text "John"
    assert_no_text "test comment by John"

    # at news page
    visit home_path
    click_link "n1head"
    assert_no_text "John"
    fill_in "Msg", with: "test comment by John"
    click_on "Submit Comment"
    assert_text "John"
    assert_text "test comment by John"
    click_on "Delete"
    assert_no_text "John"
    assert_no_text "test comment by John"
  end
end
