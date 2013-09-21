require 'spec_helper'

feature "Answer Voting:" do
let!(:user) { FactoryGirl.create :user }
let!(:question) { FactoryGirl.create :question, user_id: user.id }
let!(:answer) { FactoryGirl.create :answer, user_id: user.id, question_id: question.id }
  context "User can see voting options" do

    before do
      visit root_path
    end

    it "can see voting options if logged in" do
      fill_in "Username", :with => user.username
      fill_in "Password", :with => "password"
      click_button "signin"
      visit question_path(question)
      page.should have_button("Upvote")
      page.should have_button("Downvote")
    end

    it "can cannot see voting options not logged in" do
      visit question_path(question)
      page.should_not have_button("Upvote")
      page.should_not have_button("Downvote")
    end

    it "can see the number of votes" do
      visit question_path(question)
      page.should have_selector(".answer_score")
    end

  end

  context "Voting user"  do
    before do
      visit root_path
      fill_in "Username", :with => user.username
      fill_in "Password", :with => "password"
      click_button "signin"
      visit question_path(question)
    end

    it "cannot upvote same answer twice" do
      click_button "Upvote"
      expect { click_button "Upvote" }.to_not change{ Vote.count }.by(1)
    end

    it "cannot downvote same answer twice" do
      click_button "Downvote"
      expect { click_button "Downvote" }.to_not change{ Vote.count }.by(1)
    end

    it "can change the vote count" do
      expect { click_button "Upvote" }.to change{ answer.score }.by(1)
    end

    it "can switch from upvote to downvote" do
      click_button "Upvote"
      expect { click_button "Downvote" }.to change{ answer.score }.by(-2)
    end

    it "can unvote" do
      click_button "Upvote"
      expect { click_button "Upvote" }.to change{ answer.score }.by(-1)
    end
  end


end
