class FortunesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @fortune = Fortune.offset(rand(Fortune.count)).first
    @note = @fortune.notes.build
  end
  
  def fortune_params
    params.require(:fortune).permit(:note)
  end
end
