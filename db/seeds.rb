# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'

Fortune.delete_all
CSV.foreach("#{Rails.root}/db/fortunes.csv", col_sep: "|") do |row|
  Fortune.create(fortune: row[0], author: row[1])
end
