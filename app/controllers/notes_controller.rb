class NotesController < ApplicationController

  def new
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build
  end

  def note_redirect
    flash[:notice] = "Good thought, hope you were able to clear your mind a bit"
    if @note.user_id != nil
      redirect_to user_path(params[:note][:user_id])
    else
      flash[:notice] = "You never know when you might want to revisit an idea, why not sign up?"
      redirect_to new_user_registration_path
    end
  end

  def create
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build(note_params)
    if @note.save
      note_redirect
    else
      flash[:notice] = "Say anything, there must be something on your mind"
      redirect_to new_fortune_note_path(params[:fortune_id])
    end
  end

  def note_params
    params.require(:note).permit(:body,:user_id,:timezone)
  end
end
