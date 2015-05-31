# Controller for RESTful actions on CardDecks
class CardDecksController < ApplicationController
  def create
    card_deck = CardDeck.create(card_deck_params)

    if card_deck.save
      flash.notice = 'Card added successfully.'
    else
      flash.alert = 'Something went wrong.'
    end

    redirect_to Deck.find(params[:card_deck][:deck_id])
  end

  def destroy
    card_deck = CardDeck.find(params[:id])

    if card_deck.destroy
      flash.notice = 'Card removed successfully.'
    else
      flash.alert = 'Something went wrong.'
    end

    redirect_to card_deck.deck
  end

  private

  def card_deck_params
    params.require(:card_deck).permit(:card_id, :deck_id)
  end
end
