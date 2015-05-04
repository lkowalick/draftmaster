class DecksController < ApplicationController
  def create
    deck = Deck.create(deck_params)

    if deck.save
      flash.notice = 'Deck created successfully.'
    else
      flash.alert = 'Something went wrong.'
    end

    redirect_to deck
  end

  def update
    card = Card.find_by!(card_params)
    deck = Deck.find(params[:id])

    if CardDeck.create(deck: deck, card: card)
      flash.notice = 'Card added.'
    else
      flash.alert = 'Something went wrong.'
    end

    redirect_to deck
  end

  def destroy
    deck = Deck.find(params[:id])

    if deck.destroy
      flash.notice = 'Deck Destroyed'
    else
      flash.alert = 'Something went wrong.'
    end

    redirect_to action: 'index'
  end

  def show
    @deck = Deck.find(params[:id])
    @sets = Card.sets
    @most_recent_set = @deck.most_recently_added_set
    @card = Card.new
    @card_deck = CardDeck.new(deck_id: params[:id])
    @forest = Card.find_by!(name: 'Forest')
    @island = Card.find_by!(name: 'Island')
    @mountain = Card.find_by!(name: 'Mountain')
    @swamp = Card.find_by!(name: 'Swamp')
    @plains = Card.find_by!(name: 'Plains')
  end

  def edit
  end

  def new
  end

  def index
    @deck = Deck.new
    @decks = Deck.all
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end

  def card_params
    params.require(:card).permit(:number, :set)
  end
end
