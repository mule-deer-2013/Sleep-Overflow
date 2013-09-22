require 'spec_helper'
feature "Best Answer:" do
  let!(:question_writer) { FactoryGirl.create :user }
  let!(:question_viewer) { FactoryGirl.create :user }
  let!(:question) { FactoryGirl.create :question, user_id: question_writer.id }
  let!(:best_answer) { FactoryGirl.create :answer, user_id: question_viewer.id, question_id: question.id }
  let!(:bad_answer) { FactoryGirl.create :answer, user_id: question_viewer.id, question_id: question.id }

  context "user who is question's creator" do

    before do
      visit root_path
      fill_in "Username", with: question_writer.username
      fill_in "Password", with: "password"
      click_button "signin"
      visit "/questions/#{question.id}"
      # question.best_answer_id = best_answer.id
      # question.save
    end

    it "can see a button to choose best answer" do
      page.should have_button("Best Answer")
    end

    it "can select best answer" do
      expect { first('.edit_question').click_button("Best Answer") }.to change{ question.best_answer }
    end

    it "can unselect best answer" do
      first('.edit_question').click_button("Best Answer")
      expect { first('.edit_question').click_button("Best Answer") }.to change{ question.best_answer }
    end

    it "can change choice of best answer" do 
      first('.edit_question').click_button("Best Answer")
      expect { page.find(".edit_question:eq(2)").click_button("Best Answer") }.to change{ question.best_answer }
    end

  end

  context "user who is not question's creator" do
    before do
      visit root_path
      fill_in "Username", with: question_viewer.username
      fill_in "Password", with: "password"
      click_button "signin"
      visit "/questions/#{question.id}"
    end

    it "can see which answer is best" do
      pending
    end


    it "cannot see button to for best answer" do
      page.should_not have_button("Best Answer")
    end
  end
end