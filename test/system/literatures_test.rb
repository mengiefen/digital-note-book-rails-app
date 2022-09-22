require "application_system_test_case"

class LiteraturesTest < ApplicationSystemTestCase
  setup do
    @literature = literatures(:one)
  end

  test "visiting the index" do
    visit literatures_url
    assert_selector "h1", text: "Literatures"
  end

  test "should create literature" do
    visit literatures_url
    click_on "New literature"

    fill_in "Literature", with: @literature.literature
    fill_in "Title", with: @literature.title
    click_on "Create Literature"

    assert_text "Literature was successfully created"
    click_on "Back"
  end

  test "should update Literature" do
    visit literature_url(@literature)
    click_on "Edit this literature", match: :first

    fill_in "Literature", with: @literature.literature
    fill_in "Title", with: @literature.title
    click_on "Update Literature"

    assert_text "Literature was successfully updated"
    click_on "Back"
  end

  test "should destroy Literature" do
    visit literature_url(@literature)
    click_on "Destroy this literature", match: :first

    assert_text "Literature was successfully destroyed"
  end
end
