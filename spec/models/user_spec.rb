require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  describe "is not valid when" do
    it "email is missing" do
      subject.email = nil

      expect(subject).to_not be_valid
    end

    it "email is not an email" do
      subject.email = "not an email"

      expect(subject).to_not be_valid
    end

    it "first_name is missing" do
      subject.first_name = nil

      expect(subject).to_not be_valid
    end

    it "last_name is missing" do
      subject.last_name = nil

      expect(subject).to_not be_valid
    end
  end
end
