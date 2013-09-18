require 'spec_helper'

describe Question do
  let(:title) { Faker::Lorem.sentence }
  let(:content) { Faker::Lorem.paragraph }
  let(:question) { FactoryGirl.create :question}
  let(:user) { FactoryGirl.create :user}

  it "question is requires a title" do
    expect{ Question.create!(content: content, user_id: 1) }.to raise_error
  end

  it "question is require content" do
    expect{ Question.create!(title: title, user_id: 1) }.to raise_error
  end

  it "question should belong to a user" do
    expect{ Question.create!(title: title, content: content) }.to raise_error
  end

  it "creates question when all inputs are included" do
    expect{ Question.create!(title: title, content: content, user_id: user.id) }.to change{ Question.count }.by(1)
  end
  
end