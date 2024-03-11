require "application_system_test_case"

class TalentsTest < ApplicationSystemTestCase
  setup do
    @talent = talents(:one)
  end

  test "visiting the index" do
    visit talents_url
    assert_selector "h1", text: "Talents"
  end

  test "creating a Talent" do
    visit talents_url
    click_on "New Talent"

    fill_in "Email", with: @talent.email
    fill_in "Name", with: @talent.name
    click_on "Create Talent"

    assert_text "Talent was successfully created"
    click_on "Back"
  end

  test "updating a Talent" do
    visit talents_url
    click_on "Edit", match: :first

    fill_in "Email", with: @talent.email
    fill_in "Name", with: @talent.name
    click_on "Update Talent"

    assert_text "Talent was successfully updated"
    click_on "Back"
  end

  test "destroying a Talent" do
    visit talents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Talent was successfully destroyed"
  end
end
