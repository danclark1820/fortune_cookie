class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.references :fortune, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :fortunes
    add_foreign_key :notes, :users
  end
end
