class NotesController < ApplicationController

  def new
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build
  end

  def create
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build(note_params)
    if @note.save
      flash[:notice] = "Good thought, hope you were able to clear your mind a bit"
      #this next step should encourage the user to leave for the day, and come back tomorrow
      redirect_to user_path(params[:note][:user_id])
    else
      #this is where we can check if the person is a user yet
      #but there should be a way to save the notes of users that
      #do not want to sign in
      flash[:notice] = "Say anything, there must be something on your mind"
      redirect_to new_fortune_note_path(params[:fortune_id])
    end
  end

  def note_params
    params.require(:note).permit(:body,:user_id)
  end
end
