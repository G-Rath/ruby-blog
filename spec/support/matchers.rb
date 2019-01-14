RSpec::Matchers.define :have_submit_button do |value|
  match do |content| # casually ignore the rabbit hole of "button vs input"
    expect(content).to have_selector("input[type=submit][value='#{value}']")
  end
end
