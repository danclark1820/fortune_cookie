class CreateFortunes < ActiveRecord::Migration
  def change
    create_table :fortunes do |t|
      t.string :fortune

      t.timestamps null: false
    end
  end
end
