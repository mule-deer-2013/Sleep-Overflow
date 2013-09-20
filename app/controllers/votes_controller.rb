class VotesController < ApplicationController
	def create
		vote = Vote.create(params[:form])
		redirect_to question_path(vote.votable.question)

		# to add AJAX ...if you want to
		# 1. Instead of redirect_to, use render json: { score: vote.votable.score }
		# 2. Add 'remote: true' to the options after controller, action, and before form in the button_to
		# 3. Add some Javascript code that listens for an 'ajax:success' event to update the DOM with the new score
	end
end