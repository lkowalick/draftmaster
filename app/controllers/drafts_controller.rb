class DraftsController < ApplicationController
  def create
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
end
