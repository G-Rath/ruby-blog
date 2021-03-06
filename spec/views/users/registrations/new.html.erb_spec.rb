require "rails_helper"

RSpec.describe "users/registrations/new.html.erb", type: :view do
  before do
    stub_template "users/shared/_links.html.erb" => "User Links"

    render template: "users/registrations/new", locals: { resource: User.new, resource_name: :user }
  end

  it "should contain an email input for 'email'" do
    expect(rendered).to have_field(:user_email, type: "email")
  end

  it "should contain a text input for 'first_name'" do
    expect(rendered).to have_field(:user_first_name, type: "text")
  end

  it "should contain a text input for 'last_name'" do
    expect(rendered).to have_field(:user_last_name, type: "text")
  end

  it "should contain a password input for 'password'" do
    expect(rendered).to have_field(:user_password, type: "password")
  end

  it "should contain a password input for 'password_confirmation'" do
    expect(rendered).to have_field(:user_password_confirmation, type: "password")
  end

  it "should contain a submit button labeled 'Sign Up'" do
    expect(rendered).to have_submit_button(I18n.t("users.registrations.new.buttons.submit"))
  end
end
