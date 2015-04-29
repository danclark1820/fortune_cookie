class NotesController < ApplicationController

  def new
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build
  end

  def create
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build(note_params)
    if @note.save
      redirect_to user_path(params[:note][:user_id])
    else
      flash[:notice] = "Say anything, there must be something on your mind"
      redirect_to new_fortune_note_path(params[:fortune_id])
    end
  end

  def note_params
    params.require(:note).permit(:body,:user_id,:timezone)
  end
end
