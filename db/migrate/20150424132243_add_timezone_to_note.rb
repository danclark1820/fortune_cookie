class AddTimezoneToNote < ActiveRecord::Migration
  def change
    add_column :notes, :timezone, :string
  end
end
