require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create :user }
  let(:email) { "ian@ian.com" }
  let(:pass) { "password" }
  let(:name) { "ian" }

  describe "#create" do

    it "should require username for creation" do
      user = User.new(email: email, password_hash: pass)
      expect( user.save ).to be_false
    end

    it "should require email for creation" do
      user = User.new(username: name, password_hash: pass)
      expect( user.save ).to be_false
    end

    it "should require password for creation" do
      user = User.new(username: name, email: email)
    end

    it "should add a user to the database when given valid info" do
      expect{ User.create( username: name, email: email, password_hash: pass ) }.to change{ User.count }.by(1)
    end 
  end
end