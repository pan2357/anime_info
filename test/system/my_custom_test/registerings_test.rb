require "application_system_test_case"

class RegisteringsTest < ApplicationSystemTestCase

  test "no Name" do
    visit register_path

    fill_in "Email", with: "test1@mail.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    click_button "Register"
    assert_text "Name can't be blank"
  end

  test "no Email" do
    visit register_path

    fill_in "Name", with: "test1"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    click_button "Register"
    assert_text "Email can't be blank"
  end

  test "no Password" do
    visit register_path

    fill_in "Name", with: "test1"
    fill_in "Email", with: "test1@mail.com"
    fill_in "user_password_confirmation", with: "test"
    click_button "Register"
    assert_text "Password can't be blank and Password is too short (minimum is 3 characters)"
  end

  test "no Password confirmation" do
    visit register_path

    fill_in "Name", with: "test1"
    fill_in "Email", with: "test1@mail.com"
    fill_in "user_password", with: "test"
    click_button "Register"
    assert_text "Password confirmation doesn't match Password"
  end

  test "duplicate Name" do
    visit register_path

    fill_in "Name", with: "John"
    fill_in "Email", with: "test1@mail.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    click_button "Register"
    assert_text "Name has already been taken"
  end

  test "duplicate Email" do
    visit register_path

    fill_in "Name", with: "test1"
    fill_in "Email", with: "smith@mail.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    click_button "Register"
    assert_text "Email has already been taken"
  end

  test "password too short" do
    visit register_path

    fill_in "Name", with: "test1"
    fill_in "Email", with: "test1@mail.com"
    fill_in "user_password", with: "t"
    fill_in "user_password_confirmation", with: "t"
    click_button "Register"
    assert_text "Password is too short (minimum is 3 characters)"
  end

  test "password and confirm not match" do
    visit register_path

    fill_in "Name", with: "test1"
    fill_in "Email", with: "test1@mail.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test1111"
    click_button "Register"
    assert_text "Password confirmation doesn't match Password"
  end

  test "register success" do
    visit register_path

    fill_in "Name", with: "test1"
    fill_in "Email", with: "test1@mail.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    click_button "Register"
    assert_text "User was successfully created."
  end
end
