require "rails_helper"

RSpec.describe "layouts/_nav.html.erb", type: :view do
  context "always" do
    before do
      render
    end

    it "should contain the 'Home' link" do
      expect(rendered).to have_link(
        I18n.t("layouts._nav.buttons.home"),
        href: root_path, class: "nav-link"
      )
    end
  end

  context "when there is a signed in user" do
    before do
      allow(view).to receive(:user_signed_in?).and_return(true)

      render
    end

    it "does not show the 'Sign up' button" do
      expect(rendered).to_not have_link(I18n.t("layouts._nav.buttons.sign_up"))
    end

    it "does not show the 'Sign in' button" do
      expect(rendered).to_not have_link(I18n.t("layouts._nav.buttons.sign_in"))
    end

    it "shows the 'Sign out' button" do
      expect(rendered).to have_link(
        I18n.t("layouts._nav.buttons.sign_out"),
        href: destroy_user_session_path, class: "btn"
      )
    end
  end

  context "when there is not a signed in user" do
    before do
      allow(view).to receive(:user_signed_in?).and_return(false)

      render
    end

    it "shows the 'Sign up' button" do
      expect(rendered).to have_link(
        I18n.t("layouts._nav.buttons.sign_up"),
        href: new_user_registration_path, class: "btn"
      )
    end

    it "shows the 'Sign in' button" do
      expect(rendered).to have_link(
        I18n.t("layouts._nav.buttons.sign_in"),
        href: new_user_session_path, class: "btn"
      )
    end

    it "does not show the 'Sign out' button" do
      expect(rendered).to_not have_link(I18n.t("layouts._nav.buttons.sign_out"))
    end
  end
end
