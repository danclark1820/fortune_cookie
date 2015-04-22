class NotesController < ApplicationController

  def new
    @fortune = Fortune.find(params[:fortune_id])
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:notice] = "Good thought, hope you were able to clear your mind a bit"
      #this next step should encourage the user to leave for the day, and come back tomorrow
      redirect_to fortune_path(:fortune_id)
    else
      #this is where we can check if the person is a user yet
      #but there should be a way to save the notes of users that
      #do not want to sign in
      flash[:notice] = "Say anything, there must be something on your mind"
      redirect_to fortune_path(:fortune_id)
    end
  end

  def note_params
    params.require(:note).permit(:body, :fortune_id, :user_id)
  end
end
