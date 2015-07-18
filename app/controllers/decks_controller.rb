# Controller for RESTful actions on Decks
class DecksController < ApplicationController
  def create
    deck = Deck.create(deck_params)

    if deck.save
      flash.notice = 'Deck created successfully.'
    else
      flash.alert = 'Something went wrong.'
    end

    respond_to do |format|
      format.html { redirect_to deck }
      format.json { render json: deck }
    end
  end

  def update
    card = Card.find_by!(card_params)
    deck = current_user.decks.find_by(id: params[:id])

    unless deck
      head :forbidden
      return
    end


    if CardDeck.create(deck: deck, card: card)
      flash.notice = 'Card added.'
    else
      flash.alert = 'Something went wrong.'
    end

    respond_to do |format|
      format.html { redirect_to deck }
      format.json { render json: deck }
    end
  end

  def destroy
    deck = current_user.decks.find_by(id: params[:id])

    unless deck
      head :forbidden
      return
    end

    if deck.destroy
      flash.notice = 'Deck Destroyed'
    else
      flash.alert = 'Something went wrong.'
    end

    respond_to do |format|
      format.html { redirect_to action: 'index' }
      format.json { render json: { success: true } }
    end
  end

  def show
    @deck = Deck.find(params[:id])
    @sets = Card.sets
    @most_recent_set = @deck.most_recently_added_set
    @card = Card.new
    @land_card_decks = CardDeck.land_card_decks(@deck)
  end

  def edit
  end

  def new
  end

  def index
    @deck = Deck.new
    @draft = Draft.new
    @decks = Deck.all
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :user_id)
  end

  def card_params
    params.require(:card).permit(:number, :set)
  end
end
