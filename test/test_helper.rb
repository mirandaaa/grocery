require 'capybara/rails'
class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def log_in_as(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

  def create_list(name, desc)
    visit root_url
    log_in_as("example@hello.com", "password")
    click_link "Lists"
    click_link "Create a new list"
    fill_in "Name", with: name
    fill_in "Desc", with: desc
    click_button "Create Grocery list"
  end
end
