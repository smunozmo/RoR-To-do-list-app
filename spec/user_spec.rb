require 'rails_helper'

RSpec.describe User, :type => :model do
    
    it "is valid with valid attributes" do
        user = User.new(email: "user@mail.com", password: "password")
        expect(user).to be_valid
    end

    it "is not valid with wrong email" do
        user = User.new(email: "usermail.com", password: "password")
        expect(user).to_not be_valid
    end

    it "is not valid without an email" do
        user = User.new(email: nil, password: "password")
        expect(user).to_not be_valid
    end

    it "is not valid without a password" do
        user = User.new(email: "user@mail.com", password: nil)
        expect(user).to_not be_valid
    end

    it "is not valid with a duplicate email" do
        user = User.new(email: "user@mail.com", password: "password")
        user.save
        user2 = User.new(email: "user@mail.com", password: "password")
        expect(user2).to_not be_valid
    end

    it "is not valid with a password less than 6 characters" do
        user = User.new(email: "user@mail.com", password: "pass")
        expect(user).to_not be_valid
    end
end
