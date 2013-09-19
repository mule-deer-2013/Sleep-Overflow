class ChangeUpDownToBooleanOnVotes < ActiveRecord::Migration
  def up
  	rename_column :votes, :up_down, :old_up_down
  	add_column :votes, :up_down, :boolean
  	Vote.all.each do |vote|
  		vote.up_down = vote.old_up_down.to_i == 0 ? false : true
  		vote.save
  	end
  	remove_column :votes, :old_up_down
  end

  def down
  	rename_column :votes, :up_down, :new_up_down
  	add_column :votes, :up_down, :binary
  	Vote.all.each do |vote|
  		vote.up_down = vote.new_up_down ? 1 : 0
  		vote.save
  	end
  	remove_column :votes, :new_up_down
  end
end
