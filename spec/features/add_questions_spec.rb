require 'spec_helper'

feature 'User can add questions' do
  let!(:user) { create :user }
  let!(:question) { create :question, user_id: user.id }

  context "on add questions page" do
    it "sees a form to create a question" do
      visit new_question_path
      find_field("question_title")
      find_field("question_content")
      find_button("Create Question")
    end

    before do
      visit root_path
      fill_in "Username", :with => user.username
      fill_in "Password", :with => "password"
      click_button "signin"
      visit new_question_path
      fill_in "question_title", :with => "Do I have a question?"
      fill_in "question_content", :with => "Yes, you do."
    end

    it "creates question" do
      expect { click_button 'Create Question' }.to change(Question, :count).by(1)
    end

    it "displays questions page after entering form" do
      click_button 'Create Question'
      current_path.should == "/questions/#{Question.last.id}"
    end
  end
end
