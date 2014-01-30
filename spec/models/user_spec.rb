require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  it "is invalid without user_name" do
    user = FactoryGirl.build(:user, user_name: nil)
    expect(user).to have(1).errors_on(:user_name)
  end
  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).to have(1).errors_on(:password)
  end
  it "gives two errors with an empty email" do
    user_jack = FactoryGirl.build(:user, email: "bucket@at.com")
    user_jack = FactoryGirl.build(:user, email: "bucket@at.com")
    expect(user).to have(2).errors_on(:email)
  end
  it "must have a unique username"
  it "must have a unique email"
end
