class Note < ActiveRecord::Base
  belongs_to :fortune
  belongs_to :user
  validates :fortune, presence: true
  validates :timezone, presence: true

  def date_created
    tz = self.timezone
    offset = ActiveSupport::TimeZone[tz].utc_offset / 3600
    date_with_offset = self.created_at.to_i + offset
    date_to_show = Time.at(date_with_offset)
    date_to_show.strftime("%A at %I:%M%p on %d of %B %Y")
  end
end
