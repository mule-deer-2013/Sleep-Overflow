class VotesController < ApplicationController
	def create
		vote = Vote.create(params[:form])
		redirect_to question_path(vote.votable.question)
	end
end