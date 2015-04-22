class FortunesController < ApplicationController
  def show
    @fortune = Fortune.offset(rand(Fortune.count)).first
  end
end
