class MatchesController < ApplicationController
  def update
    @match = Match.find(params[:id])

    if @match.update_attributes(match_params)
      flash[:notice] = 'Match results entered'
    else
      flash[:alert] = 'There was a problem entering match results'
      # TODO: Use the form-field highlighting to give better errors
    end
    redirect_to @match.round
  end

  private

  def match_params
    params.require(:match).permit(:completed,
                                  :draws,
                                  :player_one_wins,
                                  :player_two_wins)
  end
end
