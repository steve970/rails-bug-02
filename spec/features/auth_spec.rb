require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")

  end

  scenario 'Users can register and be taken to the home page' do
    visit root_path
    click_on "Register"
    fill_in "Name", with: "Dylan"
    fill_in "Email", with: "dylan@gmail.com"
    fill_in "Password", with: "1234"
    fill_in "Confirm", with: "1234"
    click_button "Register"
    expect(page).to have_content("Welcome dylan@gmail.com")
  end

end
