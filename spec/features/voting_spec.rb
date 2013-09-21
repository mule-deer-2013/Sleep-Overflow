require 'spec_helper'

feature "Voting" do
let!(:user) { FactoryGirl.create :user }
let!(:question) { FactoryGirl.create :question}
  context "User can see voting options" do

    it "can see voting options if logged in" do
      visit root_path
      fill_in "Username", :with => user.username
      fill_in "Password", :with => "password"
      click_button "signin"
      visit questions_path(question)
      find_button("Upvote")
      find_button("Downvote")
    end

    it "can cannot see voting options not logged in"

    it "can see the number of votes"
  end

  context "User can vote"
    it "cannot upvote twice on a answer"

    it "can see a change in the vote count"

    it "can upvote and downvote on the same answer"

    it "can unvote"


end
