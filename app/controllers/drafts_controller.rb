class DraftsController < ApplicationController
  def create
    @draft = Draft.new(draft_params)

    if @draft.save
      flash.notice = 'Draft created'
      redirect_to @draft.rounds.first
    else
      flash.alert = 'We could not create the draft'
      redirect_to root_path
    end
  end

  def edit
  end

  def destroy
  end

  def new
    @draft = Draft.new
    8.times { @draft.players << Player.new }
  end

  def update
  end

  def show
    @draft = Draft.find(params[:id])
    @round = Round.new
  end

  private

  def draft_params
    params.require(:draft).permit(players_attributes: [:name])
  end
end
