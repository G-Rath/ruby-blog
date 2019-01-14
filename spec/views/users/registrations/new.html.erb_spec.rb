require "rails_helper"

RSpec.describe "users/registrations/new.html.erb", type: :view do
  before do
    stub_template "users/shared/_links.html.erb" => "User Links"

    render template: "users/registrations/new.html.erb", locals: { resource: User.new, resource_name: :user }
  end

  it "should contain an email input for 'email'" do
    expect(rendered).to have_field("user[email]", type: "email")
  end

  it "should contain a text input for 'first_name'" do
    expect(rendered).to have_field("user[first_name]", type: "text")
  end

  it "should contain a text input for 'last_name'" do
    expect(rendered).to have_field("user[last_name]", type: "text")
  end

  it "should contain a password input for 'password'" do
    expect(rendered).to have_field("user[password]", type: "password")
  end

  it "should contain a password input for 'password_confirmation'" do
    expect(rendered).to have_field("user[password_confirmation]", type: "password")
  end

  it "should contain a submit button labeled 'Sign Up'" do
    expect(rendered).to have_submit_button("Sign up")
  end
end
