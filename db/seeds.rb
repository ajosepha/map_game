# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GameZip.make_game_zips
game_zip = GameZip.first
game_zip.populate_tables

mapsy = User.create!(:password =>"asdfghjkl",:password_confirmation =>"asdfghjkl", :name => "Mapsy", :email => "mapsy@example.com")

game = Game.create!(:points => 100000, :money => 2000, :game_zip_id => 20, :user_id => 1)
