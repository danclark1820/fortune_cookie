class Note < ActiveRecord::Base
  belongs_to :fortune
  belongs_to :user
  validates :fortune, presence: true
end
