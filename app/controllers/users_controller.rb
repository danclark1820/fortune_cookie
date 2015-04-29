class UsersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @user = current_user
    @notes = Note.where(user_id: @user.id).reverse_order
  end
end
