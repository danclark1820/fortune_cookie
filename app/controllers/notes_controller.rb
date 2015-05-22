require 'pry'
class NotesController < ApplicationController

  def new
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build
  end

  def create
    @fortune = Fortune.find(params[:fortune_id])
    @note = @fortune.notes.build(note_params)
    if @note.timezone == nil
      @note.timezone = Note.where(user_id: note_params[:user_id]).first.timezone
    end
    if @note.save
      redirect_to user_path(params[:note][:user_id])
    else
      flash[:error] = "For some reason that note did not save"
      redirect_to new_fortune_note_path(@fortune.id)
    end
  end

  def edit
    @note = Note.find(params[:id])
    @fortune = Fortune.find(@note.fortune_id)
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to user_path(params[:note][:user_id])
    else
      render action: edit
    end
  end

  def note_params
    params.require(:note).permit(:body,:user_id,:fortune_id,:timezone)
  end
end
