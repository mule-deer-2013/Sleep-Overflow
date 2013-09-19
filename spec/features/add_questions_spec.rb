require 'spec_helper'

feature 'User can add questions' do
  context "on add questions page" do
    it "sees a form to create a question" do
      visit new_question_path
      find_field("question_title")
      find_field("question_content")
      find_button("Create Question")
    end

    it "creates question" do
      visit new_question_path

      expect {
      fill_in "question_title", :with => "Do I have a question?"
      fill_in "question_content", :with => "Yes, you do."
      click_button 'Create Question'
      }.to change(Question, :count).by(1)
    end

  end
end   