require 'spec_helper'

feature 'User add answers' do
  let!(:user) { FactoryGirl.create :user }
  let!(:question) { FactoryGirl.create :question, user_id: user.id }

  context "on question show page" do

    before do
      visit root_path
      fill_in "Username", :with => user.username
      fill_in "Password", :with => "password"
      click_button "signin"
      visit question_path(question)
    end

    it "sees a button to create an answer" do
      find_button("Add an Answer")
    end

    it "get create answer form after clicking button" do
      click_button "Add an Answer"
      current_path.should == "/questions/#{question.id}/answers/new"
    end

    it "create answer" do
      click_button "Add an Answer"
      save_and_open_page
      fill_in "Details", :with => "Yes, you do."
      expect { click_button 'Create answer' }.to change(Answer, :count).by(1)
    end
  end
end