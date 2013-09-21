class VotesController < ApplicationController
	def create
    vote = current_user.votes.build(params[:vote])
    # binding.pry
		vote.save
    redirect_to question_path(vote.votable.question)

		# to add AJAX ...if you want to
		# 1. Instead of redirect_to, use render json: { score: vote.votable.score }
		# 2. Add 'remote: true' to the options after controller, action, and before form in the button_to
		# 3. Add some Javascript code that listens for an 'ajax:success' event to update the DOM with the new score
	end

  def update
    vote = Vote.find(params[:id])
    if vote.up_down.to_s == params[:vote][:up_down]
      vote.destroy
    else
      vote.up_down = params[:vote][:up_down]
      vote.save
    end
    redirect_to question_path(vote.votable.question)
  end

end


 

  # <%= button_to '^', { url: answer_votes_path(answer, @vote), form: { up_down: 1, votable_type: 'Answer', votable_id: answer.id } }, { class: "vote-button" } %>
