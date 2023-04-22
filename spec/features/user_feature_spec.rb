require "rails_helper"

RSpec.feature "User registration and sign in", type: :feature do
  let(:user_attributes) { attributes_for(:user) }

  scenario "successfully registering a new user" do
    visit new_user_registration_path

    fill_in "Email", with: user_attributes[:email]
    fill_in "Password", with: user_attributes[:password]
    fill_in "Password confirmation", with: user_attributes[:password]
    click_button "Submit"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "unsuccessfully registering a new user with invalid data" do
    visit new_user_registration_path

    fill_in "Email", with: ""
    fill_in "Password", with: user_attributes[:password]
    fill_in "Password confirmation", with: user_attributes[:password_confirmation]
    click_button "Submit"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "successfully signing in an existing user" do
    user = create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "unsuccessfully signing in an existing user with invalid data" do
    user = create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "wrong_password"
    click_button "Log in"

    expect(page).to have_content("Log in")
  end
end
