require "application_system_test_case"

class PlatformColorsTest < ApplicationSystemTestCase
  setup do
    @platform_color = platform_colors(:one)
  end

  test "visiting the index" do
    visit platform_colors_url
    assert_selector "h1", text: "Platform Colors"
  end

  test "creating a Platform color" do
    visit platform_colors_url
    click_on "New Platform Color"

    fill_in "Color", with: @platform_color.color
    fill_in "Platform", with: @platform_color.platform
    click_on "Create Platform color"

    assert_text "Platform color was successfully created"
    click_on "Back"
  end

  test "updating a Platform color" do
    visit platform_colors_url
    click_on "Edit", match: :first

    fill_in "Color", with: @platform_color.color
    fill_in "Platform", with: @platform_color.platform
    click_on "Update Platform color"

    assert_text "Platform color was successfully updated"
    click_on "Back"
  end

  test "destroying a Platform color" do
    visit platform_colors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Platform color was successfully destroyed"
  end
end
