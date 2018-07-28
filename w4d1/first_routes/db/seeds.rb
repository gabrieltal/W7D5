# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'Funkman')
User.create!(username: 'Charlie Brown')
User.create!(username: 'Grand Master Flash')

Artwork.create!(title: 'Space', image_url: 'hi.com/art', artist_id: 1)
Artwork.create!(title: 'Disaster', image_url: 'bye.com/art', artist_id: 2)
Artwork.create!(title: 'Orange', image_url: 'see.com/art', artist_id: 3)
Artwork.create!(title: 'Mario', image_url: 'mario.com/art', artist_id: 1)

ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
ArtworkShare.create!(artwork_id: 2, viewer_id: 3)
ArtworkShare.create!(artwork_id: 3, viewer_id: 1)
