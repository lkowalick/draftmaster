class DraftsController < ApplicationController
  def create
    @draft = Draft.new(draft_params)

    if @draft.save
      flash.notice = 'Draft created'
      redirect_to @draft
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
    @users = User.all
  end

  def update
  end

  def show
    @draft = Draft.find(params[:id])
  end

  private

  def draft_params
    params
    .require(:draft)
    .permit(:player_1,
            :player_2,
            :player_3,
            :player_4,
            :player_5,
            :player_6,
            :player_7,
            :player_8)
    .select { |k, v| v.present? }
  end
end
