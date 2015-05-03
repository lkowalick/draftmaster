class CardDecksController < ApplicationController
  def create
    card_deck = CardDeck.create(card_deck_params)

    if card_deck.save
      flash.notice = 'Deck created successfully.'
    else
      flash.alert = 'Something went wrong.'
    end

    redirect_to Deck.find(params[:card_deck][:deck_id])
  end

  private

  def card_deck_params
    params.require(:card_deck).permit(:card_id, :deck_id)
  end
end
