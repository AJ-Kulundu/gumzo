require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      first_name: "John",
      last_name: "Doe",
      email: "johndoe@email.com",
      password: "Anything")
  }
  it "should save with all attributes" do
    expect(subject).to be_valid
  end
  it "should not save without a first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it "should not save without a last name" do
    last_name = subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "should not save without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "should not save without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
