class VotesController < ApplicationController
  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to :back, notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { redirect_to :back, notice: 'There was an error creating this vote.'  }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

end
