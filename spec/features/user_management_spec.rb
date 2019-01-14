require "rails_helper"

RSpec.feature "User Management", type: :feature do
  subject { FactoryBot.build(:user) }

  feature "User registration" do
    before { visit new_user_registration_path }

    scenario "User registration page can be viewed" do
      expect(page.status_code).to eq(200)
      expect(page.current_path).to eq(new_user_registration_path)

      expect(page).to have_selector "h2", text: "Sign up"
      expect(page).to have_submit_button "Sign up"
    end

    scenario "User tries to register without filling out any fields" do
      click_button "Sign up"

      expect(page).to have_invalid_bootstrap_field :user_first_name, type: "text"
      expect(page).to have_invalid_bootstrap_field :user_last_name, type: "text"
      expect(page).to have_invalid_bootstrap_field :user_email, type: "email"
      expect(page).to have_invalid_bootstrap_field :user_password, type: "password"
      expect(page).to have_invalid_bootstrap_field :user_password_confirmation, type: "password"
    end

    scenario "User tries to register with filling out all fields with valid values" do
      fill_in :user_first_name, with: subject.first_name
      fill_in :user_last_name, with: subject.last_name
      fill_in :user_email, with: subject.email
      fill_in :user_password, with: subject.password
      fill_in :user_password_confirmation, with: subject.password

      click_button "Sign up"

      expect(page.current_path).to eq(root_path)
      expect(page).to have_text "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    end
  end
end
