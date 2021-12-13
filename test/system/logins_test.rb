require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase

  test "login success" do
    visit login_path

    fill_in "Email", with: "smith@mail.com"
    fill_in "Password", with: "testpassword"
    click_on "Login"
    assert_text "You are logged in as : John"
  end

  test "wrong email" do
    visit login_path

    fill_in "Email", with: "smith"
    fill_in "Password", with: "testpassword"
    click_on "Login"
    assert_text "Email or Password incorrect"
  end

  test "wrong password" do
    visit login_path

    fill_in "Email", with: "smith@mail.com"
    fill_in "Password", with: "abcxxx"
    click_on "Login"
    assert_text "Email or Password incorrect"
  end

  test "wrong email and password" do
    visit login_path

    fill_in "Email", with: "asdf"
    fill_in "Password", with: "kj;asfk"
    click_on "Login"
    assert_text "Email or Password incorrect"
  end

end
