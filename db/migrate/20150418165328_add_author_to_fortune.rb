class AddAuthorToFortune < ActiveRecord::Migration
  def change
    add_column :fortunes, :author, :string
  end
end
