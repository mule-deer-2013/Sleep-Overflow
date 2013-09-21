require 'spec_helper'

feature "Voting on Questions:" do
let!(:user) { FactoryGirl.create :user }
let!(:question) { FactoryGirl.create :question, user_id: user.id } 
  context "User can see voting options" do

    before do
      visit root_path
    end

    it "if logged in" do
      fill_in "Username", with: user.username
      fill_in "Password", with: "password"
      click_button "signin"
      visit question_path(question)
      page.should have_button("Upvote")
      page.should have_button("Downvote")
    end

    it "if not logged in" do
      visit question_path(question)
      page.should_not have_button("Upvote")
      page.should_not have_button("Downvote")
    end

    it "including number of votes" do
      visit question_path(question)
      page.should have_selector(".question_score")
    end    

  end

  context "Voting user" do
    before do
      visit root_path
      fill_in "Username", with: user.username
      fill_in "Password", with: "password"
      click_button "signin"
      visit question_path(question)
    end

    it "cannot upvote same question twice on a question" do
      click_button "Upvote"
      expect { click_button "Upvote" }.to_not change{ Vote.count }.by(1)
    end

    it "cannot downvote same question twice" do
      click_button "Downvote"
      expect { click_button "Downvote" }.to_not change{ Vote.count }.by(1)
    end

    it "can see a change in the vote count" do
      expect { click_button "Upvote" }.to change{ question.score }.by(1)
    end

    it "can switch from downvote to upvote" do
      click_button "Downvote"
      expect { click_button "Upvote" }.to change{ question.score }.by(2)
    end

    it "can unvote" do 
      click_button "Upvote"
      expect { click_button "Upvote" }.to change{ question.score }.by(-1)
    end

  end


end

