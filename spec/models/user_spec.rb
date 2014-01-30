require 'spec_helper'

describe User do
 it "is invalid without user_name"
 it "is invalid without a password"
 it "is invalis without an email"
 it "must have a unique username"
 it "must have a unique email"
end
