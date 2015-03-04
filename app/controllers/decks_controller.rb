class DecksController < ApplicationController
  def create
    deck = Deck.create(deck_params)

    if deck.save
      flash.notice = 'Deck created successfully'
    else
      flash.notice = 'Something went wrong'
    end

    redirect_to deck
  end

  def update
  end

  def show
    @deck = Deck.find(params[:id])
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
end
