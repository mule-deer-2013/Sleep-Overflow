class AddScoreToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :score, :integer, default: 0
    Question.all.each do |question|
      question.score = question.tally
      question.save
    end
  end

  def down
    remove_column :questions, :score
  end
end
