require 'test_helper'

class GroceryListControllerTest < ActionDispatch::IntegrationTest
  # test "should not allow users to view pages without account" do
  #   visit root_url
  #   assert_equal new_user_session_path, current_path
  # end
  #
  # test "can login and view welcome page" do
  #   visit root_url
  #   log_in_as("example@hello.com", "password")
  #   assert has_content? "Welcome to Grocery!"
  # end
  #
  # test "can login and view the lists" do
  #   visit root_url
  #   log_in_as("example@hello.com", "password")
  #   click_link "Lists"
  #   assert_equal grocery_lists_path, current_path
  # end
  #
  # test "cannot view lists if not logged in" do
  #   visit root_url
  #   click_link "Lists"
  #   assert has_content? "You need to sign in or sign up before continuing."
  # end

  test "can create a new list" do
    create_list "Test List", "This is a test list."
    assert has_content? "Grocery List 'Test List' Created!"
  end

  test "can edit a list with new name and description" do
    create_list "Test List", "This is a test list."
    click_link "Edit List"
    fill_in "Name", with: "Edited"
    fill_in "Desc", with: "Edited description here."
    click_button "Update Grocery list"
    assert has_content? "Grocery List 'Edited' Updated!"
  end

  test "can delete a list" do
    create_list "Test List", "This is a test list."
    click_link "Delete List"
    assert has_content? "Grocery List 'Test List' Deleted!"
  end

end
