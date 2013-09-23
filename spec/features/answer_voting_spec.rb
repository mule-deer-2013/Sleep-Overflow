require 'spec_helper'

feature "Answer Voting:" do
let!(:user) { FactoryGirl.create :user }
let!(:question) { FactoryGirl.create :question, user_id: user.id }
let!(:answer) { FactoryGirl.create :answer, user_id: user.id, question_id: question.id }
  context "User can see voting options" do

    before do
      visit root_path
    end

    it "if logged in" do
      fill_in "Username", :with => user.username
      fill_in "Password", :with => "password"
      click_button "signin"
      visit question_path(question)
      page.should have_selector(".answer.upvote")
      page.should have_selector(".answer.downvote")
    end

    it "can cannot see voting options not logged in" do
      visit question_path(question)
      page.should_not have_selector(".answer.upvote")
      page.should_not have_selector(".answer.downvote")
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
      within ".new.answer.upvote" do 
        click_button "upvote"
      end
      within ".edit.answer.upvote" do 
        expect { click_button "upvote" }.to_not change{ Vote.count }.by(1)
      end
    end

    it "cannot downvote same answer twice" do
      within ".new.answer.downvote" do
        click_button "downvote"
      end
      # need to put "within blahblahblah inside of the curly block below"
      within ".edit.answer.downvote" do
        expect { click_button "downvote" }.to_not change{ Vote.count }.by(1)
      end
    end

    it "can change the vote count" do
      within ".new.answer.upvote" do
        expect { click_button "upvote" }.to change{ answer.score }.by(1)
      end
    end

    it "can switch from upvote to downvote" do
      within ".new.answer.upvote" do
        click_button "upvote"
      end
      within ".edit.answer.downvote" do
        expect { click_button "downvote" }.to change{ answer.score }.by(-2)
      end
    end

    it "can unvote" do
      within ".new.answer.upvote" do 
        click_button "upvote"
      end
      within ".edit.answer.upvote" do 
        expect { click_button "upvote" }.to change{ answer.score }.by(-1)
      end
    end
  end


end
