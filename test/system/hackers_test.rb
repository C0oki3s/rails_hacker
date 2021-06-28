require "application_system_test_case"

class HackersTest < ApplicationSystemTestCase
  setup do
    @hacker = hackers(:one)
  end

  test "visiting the index" do
    visit hackers_url
    assert_selector "h1", text: "Hackers"
  end

  test "creating a Hacker" do
    visit hackers_url
    click_on "New Hacker"

    fill_in "Email", with: @hacker.email
    fill_in "First name", with: @hacker.first_name
    fill_in "Last name", with: @hacker.last_name
    fill_in "Phone", with: @hacker.phone
    fill_in "Twitter", with: @hacker.twitter
    click_on "Create Hacker"

    assert_text "Hacker was successfully created"
    click_on "Back"
  end

  test "updating a Hacker" do
    visit hackers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @hacker.email
    fill_in "First name", with: @hacker.first_name
    fill_in "Last name", with: @hacker.last_name
    fill_in "Phone", with: @hacker.phone
    fill_in "Twitter", with: @hacker.twitter
    click_on "Update Hacker"

    assert_text "Hacker was successfully updated"
    click_on "Back"
  end

  test "destroying a Hacker" do
    visit hackers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hacker was successfully destroyed"
  end
end
