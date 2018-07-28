# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(email: "courage@cowardly.dog", password: "password")
user2 = User.create!(email: "cat@dog.com", password: "password")

band1 = Band.create!(name: "Queens of the Stone Age")
band2 = Band.create!(name: "Dethklok")
band3 = Band.create!(name: "Iron Maiden")

album1 = Album.create!(title: "Songs for the Deaf", year: 2005,band_id: 1, album_type: "studio")
album2 = Album.create!(title: "Dethalbum", year: 2010, band_id: 2, album_type: "studio")
album3 = Album.create!(title: "Number of the Beast", year: 1990, band_id: 3, album_type: "studio")

track1 = Track.create!(title: "Prisoner", lyrics: "Not a prisoner, Im a free man, my blood is my own now dont care what the past was i know where im going. Out!", ord: 2, album_id: 3, track_type: "regular", band_id: 3)
