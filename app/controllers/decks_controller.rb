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

  def show
    @deck = Deck.find(params[:id])
    @sets = Card.sets
    @most_recent_set = @deck.most_recently_added_set
    @card = Card.new
  end

  def edit
  end

  def new
  end

  def index
    @deck = Deck.new
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end

  def card_params
    params.require(:card).permit(:number, :set)
  end
end
