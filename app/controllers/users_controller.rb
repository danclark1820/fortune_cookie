class UsersController < ApplicationController
  def show
    @user = current_user
    @notes = Note.where(user_id: @user.id)
  end
end
