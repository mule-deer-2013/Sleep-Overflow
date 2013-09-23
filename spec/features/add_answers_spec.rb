require 'spec_helper'

feature 'User add answers' do
  let!(:user) { FactoryGirl.create :user }
  let!(:question) { FactoryGirl.create :question, user_id: user.id }

  context "on question show page" do

    before do
      # look in capybara_helpers.rb
      login user
      visit question_path(question)
    end

    # this is repetitive why? if I can click it then I can see it.
    it "sees a button to create an answer" do
      find_button("Add an Answer")
    end

    it "get create answer form after clicking button" do
      click_button "Add an Answer"
      expect(current_path).to eq new_question_answer_path(question)
    end

    it "create answer" do
      click_button "Add an Answer"
      fill_in "Details", :with => "Yes, you do."
      expect { click_button 'Create answer' }.to change(Answer, :count).by(1)
    end
  end
end
