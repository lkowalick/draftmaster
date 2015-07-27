class RoundsController < ApplicationController
  def create
    @round = Draft.find(params[:draft_id]).rounds.build
    if @round.save
      redirect_to @round
    else
      flash[:error] = 'There was a problem creating the round'
      redirect_to @draft
    end
  end

  def update
  end

  def edit
  end

  def new
  end

  def show
    @round = Round.find(params[:id])
  end

  def index
  end

  def destroy
  end
end
