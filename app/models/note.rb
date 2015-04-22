class Note < ActiveRecord::Base
  belongs_to :fortune
  belongs_to :user
end
