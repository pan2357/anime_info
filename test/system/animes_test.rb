require "application_system_test_case"

class AnimesTest < ApplicationSystemTestCase
  setup do
    @anime = animes(:one)
  end

  test "visiting the index" do
    visit animes_url
    assert_selector "h1", text: "Animes"
  end

  test "creating a Anime" do
    visit animes_url
    click_on "New Anime"

    fill_in "Day in week", with: @anime.day_in_week
    fill_in "Episode", with: @anime.episode
    fill_in "Name", with: @anime.name
    check "On air" if @anime.on_air
    fill_in "Show time", with: @anime.show_time
    fill_in "Synopsis", with: @anime.synopsis
    click_on "Create Anime"

    assert_text "Anime was successfully created"
    click_on "Back"
  end

  test "updating a Anime" do
    visit animes_url
    click_on "Edit", match: :first

    fill_in "Day in week", with: @anime.day_in_week
    fill_in "Episode", with: @anime.episode
    fill_in "Name", with: @anime.name
    check "On air" if @anime.on_air
    fill_in "Show time", with: @anime.show_time
    fill_in "Synopsis", with: @anime.synopsis
    click_on "Update Anime"

    assert_text "Anime was successfully updated"
    click_on "Back"
  end

  test "destroying a Anime" do
    visit animes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Anime was successfully destroyed"
  end
end
