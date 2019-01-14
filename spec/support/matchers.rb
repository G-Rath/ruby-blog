RSpec::Matchers.define :have_submit_button do |value|
  match do |content| # casually ignore the rabbit hole of "button vs input"
    expect(content).to have_selector("input[type=submit][value='#{value}']")
  end
end

RSpec::Matchers.define :have_invalid_bootstrap_field do |locator = nil, options = {}|
  define_method(:select) { |content| content.find_field locator, options }

  match { |content| select(content).matches_css? ".is-invalid" }
  match_when_negated { |content| select(content).not_matches_css? ".is-invalid" }
end
