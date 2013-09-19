require 'spec_helper'

feature 'User can add questions' do
  context "on add questions page" do
    it "sees a form to create a question" do
      visit new_question_path
      find_field("question_title")
      find_field("question_content")
      find_button("Create Question")
    end
  end
end   