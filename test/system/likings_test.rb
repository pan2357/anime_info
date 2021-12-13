require "application_system_test_case"

class LikingsTest < ApplicationSystemTestCase
  
  test "like when not logged in" do
    # at home page
    visit home_path
    first('[value="Like"]').click
    assert_text "Please log in first"

    # at anime page
    visit anime_page_path("a1name")
    first('[value="Like"]').click
    assert_text "Please log in first"

    # at source page
    visit source_page_path("s1name")
    first('[value="Like"]').click
    assert_text "Please log in first"

    # at news page
    visit news_page_path(news(:n1).id)
    first('[value="Like"]').click
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
    page.all('input.btn.btn-primary')[2].click
    assert_selector "input.btn.btn-danger"

    # at anime page
    click_link "a1name"
    assert_selector ".like_lister", text: "Like : 0"
    first('[value="Like"]').click
    assert_selector ".like_lister", text: "Like : 1"
    find('.like_lister').click
    assert_text "John"

    # at source page
    visit home_path
    click_link "a1name"
    click_link "Game"
    assert_selector ".like_lister", text: "Like : 0"
    first('[value="Like"]').click
    assert_selector ".like_lister", text: "Like : 1"
    find('.like_lister').click
    assert_text "John"

    # at news page
    visit home_path
    click_link "n1head"
    # visit news_page_path(news(:n1).id)
    assert_selector ".like_lister", text: "Like : 0"
    first('[value="Like"]').click
    assert_selector ".like_lister", text: "Like : 1"
    find('.like_lister').click
    assert_text "John"
  end
end
