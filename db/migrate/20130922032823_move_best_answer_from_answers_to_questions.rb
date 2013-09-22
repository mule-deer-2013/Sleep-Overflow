class MoveBestAnswerFromAnswersToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :best_answer_id, :integer
    Question.all.each do |question|
      question.find_best_answer
    end
    remove_column :answers, :is_best_answer
  end

  def down
    add_column :answers, :is_best_answer, :boolean, default: false
    Answer.all.each do |answer|
      answer.add_is_best
    end
    remove_column :questions, :best_answer_id
  end
end
