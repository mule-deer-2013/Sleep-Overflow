class AddScoreToAnswers < ActiveRecord::Migration
  def up
    add_column :answers, :score, :integer, default: 0
    Answer.all.each do |answer|
      answer.score = answer.tally
      answer.save
    end
  end

  def down
    remove_column :answers, :score
  end
end
