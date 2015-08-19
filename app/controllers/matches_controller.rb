class MatchesController < ApplicationController
  helper MatchesHelper

  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(match_params)
        format.html do
          redirect_to @match.round,
                      notice: 'Match results entered'
        end
        format.js {}
      else
        flash[:alert] = 'There was a problem entering match results'
        format.html do
          redirect_to @match.round,
                      alert: 'There was a problem entering match results'
        end
      end
    end
  end

  private

  def match_params
    params.require(:match).permit(:completed,
                                  :draws,
                                  :player_one_wins,
                                  :player_two_wins)
  end
end
